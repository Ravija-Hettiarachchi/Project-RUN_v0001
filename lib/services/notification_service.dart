import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/notification_model.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  // Initialize notifications
  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  // Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    // TODO: Handle notification tap and navigate to appropriate screen
    print('Notification tapped: ${response.payload}');
  }

  // Show notification
  Future<void> showNotification(BusNotification notification) async {
    const androidDetails = AndroidNotificationDetails(
      'bus_channel',
      'Bus Notifications',
      channelDescription: 'Notifications for bus arrivals and reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      notification.id.hashCode,
      notification.title,
      notification.body,
      notificationDetails,
      payload: notification.payload,
    );
  }

  // Schedule notification
  Future<void> scheduleNotification(
    BusNotification notification,
    DateTime scheduledDate,
  ) async {
    const androidDetails = AndroidNotificationDetails(
      'bus_channel',
      'Bus Notifications',
      channelDescription: 'Notifications for bus arrivals and reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.zonedSchedule(
      notification.id.hashCode,
      notification.title,
      notification.body,
      _convertToTZDateTime(scheduledDate),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: notification.payload,
    );
  }

  // Cancel notification
  Future<void> cancelNotification(int notificationId) async {
    await _notifications.cancel(notificationId);
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  // Helper to convert DateTime to TZDateTime
  dynamic _convertToTZDateTime(DateTime dateTime) {
    // TODO: Use timezone package for proper timezone conversion
    return dateTime;
  }
}

