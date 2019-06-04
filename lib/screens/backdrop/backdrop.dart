import 'package:finalmark/models/subject.dart';
import 'package:flutter/material.dart';
import 'panels.dart';

class Backdrop extends StatefulWidget {
  List<Subject> subjects;

  Backdrop(this.subjects);

  @override
  _BackdropState createState() => new _BackdropState(this.subjects);
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  final List<Subject> subjects;

  _BackdropState(this.subjects);

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

  bool get isVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Disciplinas"),
        elevation: 0.0,
        leading: new IconButton(
          onPressed: () {
            controller.fling(velocity: isVisible ? -1.0 : 1.0);
          },
          icon: new AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: controller.view,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: new Panels(controller, this.subjects),
    );
  }
}
