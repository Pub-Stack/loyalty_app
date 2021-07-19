import 'dart:convert';

import 'package:bonus_app/domain/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logic {
  static late List<User> usersList;
  static late SharedPreferences pref;
  static int currentIndex = 0;
  static User currentUser = testUser;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static editUser(User user) {
    currentUser = user;
  }

  static final User testUser = User(
      login: 'johndoe@gmail.com',
      name: 'John',
      lastName: 'Doe',
      dr: '',
      password: '123456',
      phoneNumber: '777777777');

  static saveUser(User user) {
    currentUser = user;
    Map map = user.toMap();
    String json = jsonEncode(map);
    pref.setString(user.login, json);
  }

  static List<User> getAllUsers() {
    var jsonList = pref.getStringList('users') ?? [];
    return usersList =
        jsonList.map((e) => User.fromMap(jsonDecode(e))).toList();
  }

  static Set<String> getLogins() {
    return pref.getKeys();
  }

  static getUser(String key) {
    String? json = pref.getString(key);
    if (json != null) {
      return User.fromMap(jsonDecode(json));
    } else {
      return '';
    }
  }
}
