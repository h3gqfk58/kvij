import 'package:flutter/material.dart';
import 'my_data/my_values.dart';
import 'my_data/my_widgets.dart';
import 'my_functions/my_helpers.dart';
import 'my_functions/my_shared_preferences.dart';
import 'my_pages/home_page.dart';
import 'my_pages/sign_in_page.dart';

class Hub extends StatefulWidget {
  const Hub({key}) : super(key: key);
  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {

  bool isLoading = true;

  initialize() async {
    MyValues.myUserIsSignedIn = await MySharedPreferences.getSharedPreferenceUserIsSignedIn() ?? false;
    if(MyValues.myUserIsSignedIn) {
      MyValues.myUserPhoneNumber = await MySharedPreferences.getSharedPreferenceUserPhoneNumber() ?? "";
      if(!MyHelpers.isPhoneNumberAllowed(MyValues.myUserPhoneNumber)) {
        await MyHelpers.signOut();
      }
    }
    else {
      await MyHelpers.signOut();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(isLoading) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: MyWidgets.myAppBarEmpty(),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(MyValues.appMargin),
                child: const CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      );
    }
    else if(MyValues.myUserIsSignedIn) {
      return const HomePage();
    }
    else {
      return const SignInPage();
    }
  }
}