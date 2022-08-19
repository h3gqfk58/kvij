import 'package:flutter/material.dart';
import 'package:kvij_admin/my_pages/settings_page.dart';
import '../my_data/my_colors.dart';
import '../my_data/my_values.dart';
import '../my_data/my_widgets.dart';
import 'account_page.dart';
import 'app_info_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({key}) : super(key: key);
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  Widget menuItem(String name) {

    IconData icon = Icons.settings;
    Color color = MyColors.myMenuItem;

    if(name == "Account") {
      icon = Icons.account_circle_rounded;
    }
    else if(name == "Settings") {
      icon = Icons.settings_rounded;
    }
    else if(name == "App info") {
      icon = Icons.info_rounded;
    }

    return GestureDetector(
      onTap: () {
        if(name == "Account") {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountPage()));
        }
        else if(name == "Settings") {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
        }
        else if(name == "App info") {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AppInfoPage()));
        }
      },
      child: Container(
        color: MyColors.myLight,
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: color,
            ),
            const SizedBox(width: 18,),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    MyValues.deviceWidth = MediaQuery.of(context).size.width;
    MyValues.deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyWidgets.myAppBarEmpty(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(MyValues.appMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: MyColors.myDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              menuItem("Account"),
              menuItem("Settings"),
              menuItem("App info"),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
