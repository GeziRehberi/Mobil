import 'dart:convert';

import 'package:flutter_widgets/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg',
    name: 'Nuri Ülgen',
    email: 'nuriulgen07@gmail.com',
    isDarkMode: false,
  );
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
