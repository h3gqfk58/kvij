import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvij_teacher/my_data/my_colors.dart';
import 'package:kvij_teacher/my_data/my_values.dart';
import 'edit_page.dart';

class QuizBlockPage extends StatefulWidget {
  const QuizBlockPage({key}) : super(key: key);
  @override
  State<QuizBlockPage> createState() => _QuizBlockPageState();
}

class _QuizBlockPageState extends State<QuizBlockPage> {

  Widget questionBlock() {
    return GestureDetector(
      onTap: () {
        MyValues.selected["question or option"] = MyValues.selected["quiz block"]["question"];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()));
      },
      child: Container(
        width: MyValues.deviceWidth - (2*MyValues.appMargin),
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: MyColors.myQuestionBack,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          MyValues.selected["quiz block"]["question"],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            color: MyColors.myDark,
          ),
        ),
      ),
    );
  }

  Widget optionBlock(int optionNumber) {

    return GestureDetector(
      onTap: () {
        MyValues.selected["question or option"] = MyValues.selected["quiz block"]["options"][optionNumber-1];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()));
      },
      child: Container(
        width: MyValues.deviceWidth - (2*MyValues.appMargin),
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: (MyValues.selected["quiz block"]["correct option"] ==  optionNumber) ? MyColors.myOptionCorrectBack : MyColors.myOptionWrongBack,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          MyValues.selected["quiz block"]["options"][optionNumber-1],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            color: (MyValues.selected["quiz block"]["correct option"] ==  optionNumber) ? MyColors.myOptionCorrect : MyColors.myOptionWrong,
          ),
        ),
      ),
    );
  }

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
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: MyColors.myLight,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: MyColors.myLight,
          toolbarHeight: 0,
          elevation: 0,
        ),
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
                  ],
                ),
                const SizedBox(height: 30,),
                questionBlock(),
                const SizedBox(height: 20,),
                for(int i=1;i<=4;i++) optionBlock(i),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
