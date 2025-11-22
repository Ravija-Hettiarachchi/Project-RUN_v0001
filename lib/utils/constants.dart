class AppConstants {
  // API endpoints
  static const String baseUrl = 'https://api.example.com';
  static const String busesEndpoint = '/buses';
  static const String routesEndpoint = '/routes';
  
  // Update intervals
  static const Duration busUpdateInterval = Duration(seconds: 5);
  static const Duration locationUpdateInterval = Duration(seconds: 10);
  
  // Notification settings
  static const int notificationReminderMinutes = 5;
  static const String notificationChannelId = 'bus_channel';
  static const String notificationChannelName = 'Bus Notifications';
  
  // Map settings
  static const double defaultZoomLevel = 15.0;
  static const double defaultLatitude = 37.7749; // San Francisco default
  static const double defaultLongitude = -122.4194;
  
  // Distance thresholds
  static const double nearbyDistanceMeters = 500.0; // 500 meters
  static const double arrivalDistanceMeters = 100.0; // 100 meters
}

