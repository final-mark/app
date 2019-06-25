import 'package:finalmark/models/subject.dart';
import 'package:finalmark/screens/widgets/mark.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {

  final Subject subject;

  SubjectCard(@required this.subject);
  // final String content = 'content';

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Card(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
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
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.blueGrey,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Mark("${this.subject.marks[index]}"),
                      itemCount: this.subject.marks.length,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
