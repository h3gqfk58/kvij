import 'package:flutter/material.dart';
import '../hub.dart';
import '../my_data/my_colors.dart';
import '../my_data/my_values.dart';
import '../my_data/my_widgets.dart';
import '../my_functions/my_helpers.dart';

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Column(
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
                          MyValues.myUserPhoneNumber,
                          style: TextStyle(
                            color: MyColors.myDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
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
                          color: MyColors.mySignOutBack,
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