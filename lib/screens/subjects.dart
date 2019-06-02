import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectScreen extends StatelessWidget {

  final String username;
  final String password;
  final bool hasLogged;

  SubjectScreen({Key key, @required this.username, @required this.password, this.hasLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplinas")
      ),
      body:FutureBuilder(
        future: fetchSubjects(username: this.username, password: this.password, force: !this.hasLogged),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData ? SubjectList(subjects: snapshot.data) : Center(child:CircularProgressIndicator());
        }
      )
    );
  }

}

class SubjectList extends StatelessWidget {
  final List<Subject> subjects;

  SubjectList({Key key, this.subjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return GestureDetector(
        child:Container(
          padding:EdgeInsets.all(10.0),
          color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(subjects[index].name, style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 16.0)
                )
            ],
          )

        )
      );
    },
    itemCount: this.subjects.length,
    );
  }
}
