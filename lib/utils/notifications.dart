import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin initNotifications() {
    FlutterLocalNotificationsPlugin notifications = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
    initializationSettingsAndroid, initializationSettingsIOS);

    notifications.initialize(initializationSettings);

    return notifications;
}

void notify(FlutterLocalNotificationsPlugin notifications, String title, String body) {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'finalmark', 'finalmark', 'finalmark',
    importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
  androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  notifications.show(0, title, body, platformChannelSpecifics);
}
