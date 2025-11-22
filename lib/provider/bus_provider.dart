import 'package:flutter/foundation.dart';
import '../models/bus_model.dart';
import '../services/bus_service.dart';

class BusProvider with ChangeNotifier {
  final BusService _busService = BusService();
  List<Bus> _buses = [];
  bool _isLoading = false;
  String? _error;

  List<Bus> get buses => _buses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  BusProvider() {
    _loadBuses();
    _startPeriodicUpdates();
  }

  // Load buses
  Future<void> _loadBuses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _buses = await _busService.fetchActiveBuses();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _buses = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh buses
  Future<void> refreshBuses() async {
    await _loadBuses();
  }

  // Get bus by ID
  Bus? getBusById(String busId) {
    try {
      return _buses.firstWhere((bus) => bus.id == busId);
    } catch (e) {
      return null;
    }
  }

  // Start periodic updates
  void _startPeriodicUpdates() {
    // TODO: Implement periodic updates using Stream
    // For now, this is a placeholder
  }

  // Get ETA for a bus
  Future<String> getETA(String busId, String stopId) async {
    try {
      return await _busService.getETA(busId, stopId);
    } catch (e) {
      return 'N/A';
    }
  }
}

