import 'package:flutter/material.dart';

class Mark extends StatelessWidget{

  final String mark;

  Mark(this.mark);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)) ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          ListTile(
            title: Text("nota"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(this.mark,
                style: TextStyle(fontSize: 20)
              ),
            )
          ),
        ]
      )
    );
  }
}
