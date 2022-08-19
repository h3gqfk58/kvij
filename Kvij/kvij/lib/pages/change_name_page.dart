import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/my_functions/my_helpers.dart';
import '../my_data/my_widgets.dart';

class ChangeNamePage extends StatefulWidget {
  const ChangeNamePage({key}) : super(key: key);
  @override
  State<ChangeNamePage> createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends State<ChangeNamePage> {

  TextEditingController textEditingControllerName = TextEditingController();

  @override
  void initState() {
    textEditingControllerName.text = MyValues.myUserName;
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
        body: SingleChildScrollView(
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
                      "Change Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60,),
                Form(
                  child: TextFormField(
                    controller: textEditingControllerName,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        MyValues.myUserName = textEditingControllerName.text;
                        await MyHelpers.assignUserValuesToUserSharedPreferences();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                        decoration: BoxDecoration(
                          color: const Color(0xff507ea1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MyColors.myLight,
                            letterSpacing: 0.2,
                          ),
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