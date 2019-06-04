import 'package:finalmark/screens/backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectScreen extends StatelessWidget {
  final String username;
  final String password;
  final bool hasLogged;

  SubjectScreen(
      {Key key,
      @required this.username,
      @required this.password,
      this.hasLogged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Disciplinas")),
        body: FutureBuilder(
            future: fetchSubjects(
                username: this.username,
                password: this.password,
                force: !this.hasLogged),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? SubjectList(subjects: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }));
  }
}

class SubjectList extends StatelessWidget {
  final List<Subject> subjects;

  SubjectList({Key key, this.subjects}) : super(key: key);

  @override
  Widget build(BuildContext context) => Backdrop(this.subjects);
}
