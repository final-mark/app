import 'package:finalmark/screens/backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../store/store.dart';

class SubjectScreen extends StatefulWidget {
  final String username;
  final String password;
  final bool hasLogged;

  SubjectScreen({this.username, this.password, this.hasLogged});

  @override
  State<StatefulWidget> createState() => _SubjectScreenState(this.username, this.password, this.hasLogged);
}

class _SubjectScreenState extends State<SubjectScreen> {

  final String username;
  final String password;
  final bool hasLogged;
  dynamic userInfo;
  _SubjectScreenState(this.username, this.password, this.hasLogged);

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

              UserDataStore.getStore().then((store) {
                this.userInfo = store.getUserInfo();
              });

              return snapshot.hasData && this.userInfo != null
                  ? SubjectList(subjects: snapshot.data, userInfo: userInfo)
                  : Center(child: CircularProgressIndicator());
        }));
      }
  }


class SubjectList extends StatelessWidget {
  final List<Subject> subjects;
  final userInfo;

  SubjectList({Key key, this.subjects, this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) => Backdrop(this.subjects, this.userInfo);
}
