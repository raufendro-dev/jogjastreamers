import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('original');

    var initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, ongoing: true));
  }

  Future showNotification(title, body) async {
    return flutterLocalNotificationsPlugin.show(
        0, title, body, await notificationDetails());
  }
}
