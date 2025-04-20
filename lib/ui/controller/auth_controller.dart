import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? userModel;

  static const String _tokenKey = 'token';
  static const String _userDataKey = 'user-data';

  //save user information
  static Future<void> saveUserInformation(
      String accessToken, UserModel userM) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, accessToken);
    sharedPreferences.setString(_userDataKey, jsonEncode(userM.toJson()));

    //save data
    token = accessToken;
    userModel = userM;
  }

  //get user information
  static Future<void> getUserInformation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(_tokenKey);
    String? savedUserModel = sharedPreferences.getString(_userDataKey);

    if (savedUserModel != null) {
      UserModel savedModel = UserModel.fromJson(jsonDecode(savedUserModel));
      userModel = savedModel;
    }
    token = accessToken;
  }

  static Future<bool> checkedIfUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userAccessToken = sharedPreferences.getString(_tokenKey);

    if (userAccessToken != null) {
      await getUserInformation();
      return true;
    }
    return false;
  }

  //clear data during logout
  static Future<void> clearUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    userModel = null;
  }
}
