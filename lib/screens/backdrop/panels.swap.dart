import 'package:finalmark/models/subject.dart';
import 'package:flutter/material.dart';

class Panels extends StatefulWidget {
  final AnimationController controller;
  final List<Subject> subjects;

  Panels(this.controller, @required this.subjects);

  @override
  _PanelsState createState() => _PanelsState(this.subjects);
}

class _PanelsState extends State<Panels> with SingleTickerProviderStateMixin {
  static const header_height = 32.0;
  final List<Subject> subjects;

  _PanelsState(this.subjects);

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(
          0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(
        new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    print("subjects numberrr:" + this.subjects.length.toString());
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: Colors.blue,
            child: new Center(
              child: new Text("Back Panel",
                  style: new TextStyle(fontSize: 24.0, color: Colors.white)),
            ),
          ),
          new PositionedTransition(
              rect: getPanelAnimation(constraints),
              child: new Material(
                elevation: 12.0,
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(20.0),
                    topRight: new Radius.circular(20.0)),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: header_height,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  color: index % 2 == 0
                                      ? Colors.greenAccent
                                      : Colors.cyan,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(this.subjects[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0))
                                    ],
                                  )));
                        },
                        itemCount: this.subjects.length,
                      ),
                    ),
                    new Expanded(
                      child: new Center(
                        child: new Text("Front Panel",
                            style: new TextStyle(
                                fontSize: 24.0, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ))
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
