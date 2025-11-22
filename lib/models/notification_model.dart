class BusNotification {
  final String id;
  final String title;
  final String body;
  final String? payload;
  final DateTime? scheduledTime;
  final String? busId;
  final String? stopId;

  BusNotification({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
    this.scheduledTime,
    this.busId,
    this.stopId,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'payload': payload,
      'scheduledTime': scheduledTime?.toIso8601String(),
      'busId': busId,
      'stopId': stopId,
    };
  }

  // Create from Map (Firestore)
  factory BusNotification.fromMap(Map<String, dynamic> map, String id) {
    return BusNotification(
      id: id,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      payload: map['payload'],
      scheduledTime: map['scheduledTime'] != null
          ? DateTime.parse(map['scheduledTime'])
          : null,
      busId: map['busId'],
      stopId: map['stopId'],
    );
  }

  // Create a copy with updated fields
  BusNotification copyWith({
    String? id,
    String? title,
    String? body,
    String? payload,
    DateTime? scheduledTime,
    String? busId,
    String? stopId,
  }) {
    return BusNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      payload: payload ?? this.payload,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      busId: busId ?? this.busId,
      stopId: stopId ?? this.stopId,
    );
  }
}

