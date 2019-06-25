import 'package:finalmark/models/subject.dart';
import 'package:finalmark/screens/widgets/mark.dart';
import 'package:flutter/material.dart';

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
            ListTile(
              leading: Icon(Icons.book),
              title: Text("${this.subject.name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
              subtitle: Text("Faltas: ${this.subject.absences}h",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
            ),
            Divider(
              color: Colors.grey,
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
