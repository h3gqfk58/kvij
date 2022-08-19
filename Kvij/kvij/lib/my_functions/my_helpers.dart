import 'package:kvij/my_data/my_values.dart';
import 'my_shared_preferences.dart';

class MyHelpers {

  static resetUserValues() {
    MyValues.myUserIsSignedIn = false;
    MyValues.myUserPhoneNumber = "";
    MyValues.myUserName = "";
  }

  static Future<bool> assignUserValuesToUserSharedPreferences() async {
    bool returnValue = true;
    if(!await MySharedPreferences.saveSharedPreferenceUserIsSignedIn(MyValues.myUserIsSignedIn)) returnValue = false;
    if(!await MySharedPreferences.saveSharedPreferenceUserPhoneNumber(MyValues.myUserPhoneNumber)) returnValue = false;
    if(!await MySharedPreferences.saveSharedPreferenceUserName(MyValues.myUserName)) returnValue = false;
    return returnValue;
  }

  static signOut() async {
    resetUserValues();
    await assignUserValuesToUserSharedPreferences();
  }

}