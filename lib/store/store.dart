import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class UserDataStore {

  SharedPreferences store;

  initStore() async {
    final store = await SharedPreferences.getInstance();
    this.store = store;
  }

  static Future<UserDataStore> getStore() async {
    final store = UserDataStore();
    await store.initStore();
    return store;
  }

  dynamic getCredentials() {
    final String username = this.store.getString('finalmark:username') ?? null;
    final String password = this.store.getString('finalmark:password') ?? null;

    return { "username": username, "password": password };
  }

  void setCredentials(dynamic credentials) {
    this.store.setString('finalmark:username', credentials['username']);
    this.store.setString('finalmark:password', credentials['password']);
  }

  bool hasLogged() {
    dynamic credentials = this.getCredentials();
    print(credentials);
    return credentials['username'] != null && credentials['password'] != null;
  }

  dynamic getSubjects() {
    return json.decode(this.store.getString('finalmark:subjects'));
  }

  void setSubjects(dynamic subjects) {
    this.store.setString('finalmark:subjects', json.encode(subjects));
  }

  void clean() {
    this.store.remove('finalmark:subjects');
    this.store.remove('finalmark:username');
    this.store.remove('finalmark:password');
  }

}
