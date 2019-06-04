import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:finalmark/utils/notifications.dart' as notification;
import 'package:finalmark/screens/login.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';


void printHello() {
  final notify = notification.initNotifications();
  notification.notify(notify, "hmm", "dois");
}

void main() async {
  final int helloAlarmID = 0;
  await AndroidAlarmManager.initialize();
  runApp(FinalMark());
  // await AndroidAlarmManager.periodic(const Duration(seconds: 10), helloAlarmID, printHello);
}

class FinalMark extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppConfig();
}

class _AppConfig extends State<FinalMark> with SingleTickerProviderStateMixin {

  FlutterLocalNotificationsPlugin notifications;

  @override
  void initState() {
    super.initState();
    this.notifications = notification.initNotifications();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'FinalMark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
      },
    );
  }
}
