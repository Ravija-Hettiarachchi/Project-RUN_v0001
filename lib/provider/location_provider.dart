import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  Position? _currentPosition;
  bool _isLoading = false;
  String? _error;
  bool _permissionGranted = false;

  Position? get currentPosition => _currentPosition;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get permissionGranted => _permissionGranted;
  double? get latitude => _currentPosition?.latitude;
  double? get longitude => _currentPosition?.longitude;

  LocationProvider() {
    _checkPermissions();
  }

  // Check and request permissions
  Future<void> _checkPermissions() async {
    try {
      final permission = await _locationService.checkPermission();
      if (permission == LocationPermission.denied) {
        final newPermission = await _locationService.requestPermission();
        _permissionGranted = newPermission == LocationPermission.whileInUse ||
            newPermission == LocationPermission.always;
      } else {
        _permissionGranted = permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always;
      }
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Get current position
  Future<void> getCurrentPosition() async {
    if (!_permissionGranted) {
      await _checkPermissions();
      if (!_permissionGranted) {
        _error = 'Location permission not granted';
        notifyListeners();
        return;
      }
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentPosition = await _locationService.getCurrentPosition();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _currentPosition = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Start listening to position updates
  void startLocationUpdates() {
    if (!_permissionGranted) {
      _checkPermissions();
      return;
    }

    _locationService.getPositionStream().listen(
      (position) {
        _currentPosition = position;
        _error = null;
        notifyListeners();
      },
      onError: (error) {
        _error = error.toString();
        notifyListeners();
      },
    );
  }

  // Calculate distance to a point
  double? calculateDistanceTo(double lat, double lon) {
    if (_currentPosition == null) return null;
    return _locationService.calculateDistance(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      lat,
      lon,
    );
  }
}

