import 'package:flutter/material.dart';
import 'subjects.dart';
import '../store/store.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Metropolis', fontSize: 20.0);

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserDataStore.getStore().then((store) {
      if (store.hasLogged()) {
        final credentials = store.getCredentials();
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectScreen(
                    username: credentials['username'],
                    password: credentials['password'])));
      }
    });

  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      controller: usernameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Matrícula",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passwordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final LoginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.pink,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubjectScreen(username: usernameController.text, password: passwordController.text)
              )
            );
            },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Center(
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            child: Container(
              color: Color(0xFFEDEDED),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login Example',
                      style: style.copyWith(
                          color: Colors.pink,
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 45.0),
                    usernameField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0),
                    LoginButton,
                    SizedBox(height: 15.0),
                    InkWell(
                        child: Text(
                          'Create an account',
                          style: style.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        onTap: () => Navigator.pushNamed(context, '/signup'))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
