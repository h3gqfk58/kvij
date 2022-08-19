import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_colors.dart';

class MyWidgets {
  static Widget myAppTitle() {
    return Wrap(
      spacing: 18,
      runSpacing: 15,
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: MyColors.myAppIconTemporary,
          ),
        ),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kvij",
                style: TextStyle(
                  color: MyColors.myDark,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
              const Expanded(child: SizedBox(),),
              Text(
                "The Quiz App",
                style: TextStyle(
                  color: MyColors.myDark,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  static AppBar myAppBarEmpty() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.myTransparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: MyColors.myTransparent,
      toolbarHeight: 0,
      elevation: 0,
    );
  }
}