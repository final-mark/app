import 'package:finalmark/models/subject.dart';
import 'package:finalmark/screens/widgets/mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectCard extends StatelessWidget {

  final Subject subject;

  SubjectCard(@required this.subject);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                color: Colors.blue
              ),
              child: ListTile(
                leading: Text(
                  "${this.subject.average}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    ),
                ),
                title: Text("${this.subject.name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(color: Colors.white)),
                subtitle: Text("Faltas: ${this.subject.absences}h",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1),
              )
            ),
            Container(
              height: 70,
              alignment: Alignment.center,
              child: Center(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Mark("${this.subject.marks[index]}", index),
                  itemCount: this.subject.marks.length,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
