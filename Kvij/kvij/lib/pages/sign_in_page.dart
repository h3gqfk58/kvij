import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/my_data/my_widgets.dart';
import 'package:kvij/my_functions/my_helpers.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({key}) : super(key: key);
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool isLoading = false, isContinued = false;
  var formKeyPhoneNumber = GlobalKey<FormState>();
  var formKeyOTP = GlobalKey<FormState>();
  TextEditingController textEditingControllerPhoneNoCountryCode = TextEditingController();
  TextEditingController textEditingControllerPhoneNoOnly = TextEditingController();
  TextEditingController textEditingControllerOTP = TextEditingController();
  String sentOTP = "";

  @override
  void initState() {
    textEditingControllerPhoneNoCountryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MyValues.deviceWidth = MediaQuery.of(context).size.width;
    MyValues.deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: MyWidgets.myAppBarEmpty(),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(MyValues.appMargin),
              child: (isLoading) ? const CircularProgressIndicator() : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidgets.myAppTitle(),
                  const SizedBox(height: 60,),
                  (!isContinued) ? Column(
                    children: [
                      Form(
                        key: formKeyPhoneNumber,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: TextFormField(
                                controller: textEditingControllerPhoneNoCountryCode,
                                validator: (value) {
                                  return (value != "+91") ? "Invalid Country code" : null;
                                },
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: TextFormField(
                                controller: textEditingControllerPhoneNoOnly,
                                validator: (value) {
                                  return (value.toString().length < 10) ? "Invalid Phone number" : null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Phone number",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xffdce5ec),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff507ea1),
                                  letterSpacing: 0.2,
                                ),
                              ),

                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              if(formKeyPhoneNumber.currentState!.validate()) {
                                sentOTP = "000000";
                                setState(() {
                                  isContinued = true;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xff507ea1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.myLight,
                                  letterSpacing: 0.2,
                                ),
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ) : Column(
                    children: [
                      Form(
                        key: formKeyOTP,
                        child: TextFormField(
                          controller: textEditingControllerOTP,
                          validator: (value) {
                            return (value.toString() != sentOTP) ? "Invalid OTP" : null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "OTP",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if(formKeyOTP.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                MyValues.myUserIsSignedIn = true;
                                MyValues.myUserPhoneNumber = textEditingControllerPhoneNoCountryCode.text + " " + textEditingControllerPhoneNoOnly.text;
                                MyValues.myUserName = "";
                                await MyHelpers.assignUserValuesToUserSharedPreferences();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xff507ea1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.myLight,
                                  letterSpacing: 0.2,
                                ),
                              ),

                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}