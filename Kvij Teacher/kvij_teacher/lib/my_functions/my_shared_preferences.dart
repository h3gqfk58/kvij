import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static Future<bool> saveSharedPreferenceUserIsSignedIn(bool userIsSignedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool("user is signed in", userIsSignedIn);
  }
  static Future<bool> saveSharedPreferenceUserPhoneNumber(String userPhoneNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString("user phone number", userPhoneNumber);
  }

  static Future<bool?> getSharedPreferenceUserIsSignedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("user is signed in");
  }
  static Future<String?> getSharedPreferenceUserPhoneNumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("user phone number");
  }
}