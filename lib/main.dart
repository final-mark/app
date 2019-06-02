import 'package:finalmark/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:finalmark/screens/login.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void main() => runApp(LoginExample());



class LoginExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppConfig();
}

class _AppConfig extends State<LoginExample> with SingleTickerProviderStateMixin {

  FlutterLocalNotificationsPlugin notifications;

  @override
  void initState() {
    super.initState();
    this.notifications = initNotifications();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'LoginExample',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
      },
    );
  }
}
