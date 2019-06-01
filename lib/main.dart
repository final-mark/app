import 'package:flutter/material.dart';
import 'package:finalmark/screens/login.dart';

void main() => runApp(Finalmark());

class Finalmark extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finalmark',
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
