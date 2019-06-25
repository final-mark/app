import 'package:finalmark/models/subject.dart';
import 'package:finalmark/screens/widgets/subject_card.dart';
import 'package:finalmark/screens/widgets/user_info.dart';
import 'package:flutter/material.dart';

class Panels extends StatefulWidget {
  final AnimationController controller;
  final List<Subject> subjects;
  final userInfo;

  Panels(this.controller, @required this.subjects, @required this.userInfo);

  @override
  _PanelsState createState() => _PanelsState(this.controller, this.subjects, this.userInfo);
}

class _PanelsState extends State<Panels> with SingleTickerProviderStateMixin {
  final List<Subject> subjects;
  final userInfo;
  final controller;

  _PanelsState(this.controller, this.subjects, this.userInfo);

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final headerHeight = height * 0.83; // 83%
    final headerHeightOpened = MediaQuery.of(context).padding.top + 45;
    final backPanelHeight = height - headerHeight;
    final frontPanelHeight = -headerHeight;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(
          0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: new RelativeRect.fromLTRB(0.0, headerHeightOpened, 0.0, 0.0),
    ).animate(
        new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  bool get isVisible {
    final AnimationStatus status = this.controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    return Container(
          child: new Stack(
            children: <Widget>[
              Positioned(
                child: GestureDetector(
                  onHorizontalDragDown: (details) {
                    this.controller.fling(velocity: isVisible ? -1.0 : 1.0);
                  },
                  child: Container(
                    color: Colors.blue,
                    child: new Container(
                      alignment: Alignment.center,
                      height: constraints.biggest.height * 0.2,
                      child: UserInfo(this.userInfo),
                    ),
                  ),
                )
              ),
              new Container(height: constraints.biggest.height),
              new PositionedTransition(
                  rect: getPanelAnimation(constraints),
                  child: new Material(
                    elevation: 12.0,
                    color: Color(0xFFF5F5F5),
                    borderRadius: new BorderRadius.only(
                        topLeft: new Radius.circular(20.0),
                        topRight: new Radius.circular(20.0)),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Container(
                                padding: EdgeInsets.all(5.0),
                                child: SubjectCard(this.subjects[index])
                                ));
                      },
                      itemCount: this.subjects.length,
                    ),
                  )),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}
