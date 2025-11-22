class Bus {
  final String id;
  final String routeNumber;
  final String routeName;
  final double latitude;
  final double longitude;
  final String eta;
  final String? nextStop;
  final List<String>? routeStops;
  final DateTime? lastUpdated;

  Bus({
    required this.id,
    required this.routeNumber,
    required this.routeName,
    required this.latitude,
    required this.longitude,
    required this.eta,
    this.nextStop,
    this.routeStops,
    this.lastUpdated,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'routeNumber': routeNumber,
      'routeName': routeName,
      'latitude': latitude,
      'longitude': longitude,
      'eta': eta,
      'nextStop': nextStop,
      'routeStops': routeStops,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  // Create from Map (Firestore)
  factory Bus.fromMap(Map<String, dynamic> map, String id) {
    return Bus(
      id: id,
      routeNumber: map['routeNumber'] ?? '',
      routeName: map['routeName'] ?? '',
      latitude: (map['latitude'] ?? 0.0).toDouble(),
      longitude: (map['longitude'] ?? 0.0).toDouble(),
      eta: map['eta'] ?? 'N/A',
      nextStop: map['nextStop'],
      routeStops: map['routeStops'] != null
          ? List<String>.from(map['routeStops'])
          : null,
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.parse(map['lastUpdated'])
          : null,
    );
  }

  // Create a copy with updated fields
  Bus copyWith({
    String? id,
    String? routeNumber,
    String? routeName,
    double? latitude,
    double? longitude,
    String? eta,
    String? nextStop,
    List<String>? routeStops,
    DateTime? lastUpdated,
  }) {
    return Bus(
      id: id ?? this.id,
      routeNumber: routeNumber ?? this.routeNumber,
      routeName: routeName ?? this.routeName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      eta: eta ?? this.eta,
      nextStop: nextStop ?? this.nextStop,
      routeStops: routeStops ?? this.routeStops,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

