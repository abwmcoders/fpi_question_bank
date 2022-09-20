// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  // keys
  static String UserLoggedInKey = 'LOGGEDINKEY';
  static String UserEmailKey = 'USEREMAILKEY';
  static String UsernameKey = 'USERNAMEKEY';
  static String UserMatricKey = 'USERMATRICKEY';

  // saving data to sf
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(UserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUsername(String isUsername) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(UsernameKey, isUsername);
  }

  static Future<bool> saveUserEmailKey(String isUserEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(UserEmailKey, isUserEmail);
  }

  static Future<bool> saveUserMatricKey(String isUserMatric) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(UserEmailKey, isUserMatric);
  }

// getting data from sf

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(UserLoggedInKey);
  }

  static Future<String?> getUserNameFromSp() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(UsernameKey);
  }

  static Future<String?> getUserEmailFromSp() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(UserEmailKey);
  }

  static Future<String?> getUserMatric() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(UserMatricKey);
  }
}
