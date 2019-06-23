import 'package:finalmark/models/subject.dart';
import 'package:flutter/material.dart';
import 'panels.dart';

class Backdrop extends StatefulWidget {
  List<Subject> subjects;
  dynamic userInfo;

  Backdrop(this.subjects, this.userInfo);

  @override
  _BackdropState createState() => new _BackdropState(this.subjects, this.userInfo);
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  final List<Subject> subjects;
  final userInfo;
  _BackdropState(this.subjects, this.userInfo);

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Panels(this.controller, this.subjects, this.userInfo);
  }
}
