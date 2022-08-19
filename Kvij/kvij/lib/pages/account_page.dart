import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/my_data/my_widgets.dart';
import 'package:kvij/my_functions/my_helpers.dart';
import '../hub.dart';
import 'change_name_page.dart';
import 'change_phone_number_page.dart';
import 'change_profile_picture_page.dart';
import 'delete_account_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({key}) : super(key: key);
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  bool isLoading = false;

  @override
  void initState() {
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
        body: (isLoading) ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(MyValues.appMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: MyColors.myDark,
                      ),
                    ),
                    const SizedBox(width: 30,),
                    const Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                if(MyValues.myUserIsSignedIn) Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeProfilePicturePage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.myAccountPicture,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  margin: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: MyColors.myLight,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Icon(
                                  Icons.account_box_rounded,
                                  color: MyColors.myAccountPicture,
                                  size: 88,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeNamePage())).then((value) {
                          setState(() {
                          });
                        });
                      },
                      child: Container(
                        color: MyColors.myLight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 11,
                                color: MyColors.myGrey,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              (MyValues.myUserName == "") ? "Not Set" : MyValues.myUserName,
                              style: TextStyle(
                                color: (MyValues.myUserName == "") ? MyColors.myAccountDelete : MyColors.myDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePhoneNumberPage())).then((value){
                          setState(() {
                          });
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(
                              fontSize: 11,
                              color: MyColors.myGrey,
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            (MyValues.myUserPhoneNumber == "") ? "Not Set" : MyValues.myUserPhoneNumber,
                            style: TextStyle(
                              color: (MyValues.myUserPhoneNumber == "") ? MyColors.myAccountDelete : MyColors.myDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteAccountPage()));
                      },
                      child: Container(
                        width: MyValues.deviceWidth - (2*MyValues.appMargin),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.myAccountDeleteBack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_rounded,
                              color: MyColors.myAccountDelete,
                              size: 22,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Delete Account",
                              style: TextStyle(
                                color: MyColors.myAccountDelete,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(width: 15,),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 35,),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await MyHelpers.signOut();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Hub()), (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: MyValues.deviceWidth - (2*MyValues.appMargin),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.myTranslucentDark,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: MyColors.myMenuItem,
                              size: 22,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                color: MyColors.myMenuItem,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(width: 15,),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                else Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await MyHelpers.signOut();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Hub()), (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: MyValues.deviceWidth - (2*MyValues.appMargin),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.mySignInBack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.login_rounded,
                              color: MyColors.mySignIn,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                color: MyColors.mySignIn,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4,
                              ),
                            ),
                            const SizedBox(width: 15,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}