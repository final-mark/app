import 'package:http/http.dart' as http;
import 'dart:convert';
import '../store/store.dart';

class Subject {
  String code;
  String name;
  int absences;
  int credits;
  String semester;
  List marks;

  Subject({
    this.code,
    this.name,
    this.absences,
    this.credits,
    this.semester,
    this.marks
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      code: json["code"],
      name: json["name"],
      absences: json["absences"],
      credits: json["credits"],
      semester: json["semester"],
      marks: json["marks"]
    );
  }
}

Future<List<Subject>> fetchSubjects({String username, String password, bool force}) async {
  final store = await UserDataStore.getStore();
  var subjects = [];
  if (force) {
    final response = await http.post(
      'http://scaler.mmelo.me',
      body: json.encode({
        "plugin": "finalmark",
        "action": "refresh_user",
        "username": username,
        "password": password
      }),
      headers: {
        "Content-Type": "application/json"
      }
    );
    if(response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if(responseData['status'] == 'success') {
        subjects = responseData['subjects'];
      }
      store.setUserInfo(responseData['user_info']);
    }
    else {
      throw Exception("deu merda hein, ${response.body}    ${username + " " + password}");
      }
    } else {
      subjects = store.getSubjects();
    }

  final subjectList = await subjects.map<Subject>((json) {
    return Subject.fromJson(json);
  });

  store.setCredentials({
    "username": username,
    "password": password
  });

  store.setSubjects(subjects);

  print(store.getUserInfo());

  return subjectList.toList();
}

void storeInfo(String username, String password, List subjects) {
  UserDataStore store = UserDataStore();
  store.setCredentials({
    username: username,
    password: password
    });
  store.setSubjects(subjects);
}
