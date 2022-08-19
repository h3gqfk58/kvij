import '../my_data/my_values.dart';
import 'my_shared_preferences.dart';

class MyHelpers {

  static resetUserValues() {
    MyValues.myUserIsSignedIn = false;
    MyValues.myUserPhoneNumber = "";
  }

  static Future<bool> assignUserValuesToUserSharedPreferences() async {
    bool returnValue = true;
    if(!await MySharedPreferences.saveSharedPreferenceUserIsSignedIn(MyValues.myUserIsSignedIn)) returnValue = false;
    if(!await MySharedPreferences.saveSharedPreferenceUserPhoneNumber(MyValues.myUserPhoneNumber)) returnValue = false;
    return returnValue;
  }

  static signOut() async {
    resetUserValues();
    await assignUserValuesToUserSharedPreferences();
  }

  static bool isPhoneNumberAllowed(String phoneNumber) {
    bool flag = false;
    for(int i=0;i<MyValues.allowedUsersPhoneNumbers.length;i++) {
      if(phoneNumber == MyValues.allowedUsersPhoneNumbers[i]) {
        flag = true;
      }
    }
    return flag;
  }

}