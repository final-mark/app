import 'package:flutter/material.dart';

class Mark extends StatelessWidget{

  final String mark;
  final int index;

  Mark(this.mark, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)) ,
      child: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Text("Nota ${this.index+1}",
            style: TextStyle(fontSize: 15),
          ),
          Container(
            width: 70,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(this.mark,
                style: TextStyle(fontSize: 25)
              ),
            )
          ),
        ]
      ),
      )
    );
  }
}
