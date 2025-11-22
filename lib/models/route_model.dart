class RouteModel {
  final String routeNumber;
  final String routeName;
  final List<String> stops;
  final String? description;
  final double? distance; // in kilometers

  RouteModel({
    required this.routeNumber,
    required this.routeName,
    required this.stops,
    this.description,
    this.distance,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'routeNumber': routeNumber,
      'routeName': routeName,
      'stops': stops,
      'description': description,
      'distance': distance,
    };
  }

  // Create from Map (Firestore)
  factory RouteModel.fromMap(Map<String, dynamic> map) {
    return RouteModel(
      routeNumber: map['routeNumber'] ?? '',
      routeName: map['routeName'] ?? '',
      stops: map['stops'] != null ? List<String>.from(map['stops']) : [],
      description: map['description'],
      distance: map['distance']?.toDouble(),
    );
  }

  // Create a copy with updated fields
  RouteModel copyWith({
    String? routeNumber,
    String? routeName,
    List<String>? stops,
    String? description,
    double? distance,
  }) {
    return RouteModel(
      routeNumber: routeNumber ?? this.routeNumber,
      routeName: routeName ?? this.routeName,
      stops: stops ?? this.stops,
      description: description ?? this.description,
      distance: distance ?? this.distance,
    );
  }
}

