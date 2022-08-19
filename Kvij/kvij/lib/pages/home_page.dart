import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/pages/subject_page.dart';
import '../my_data/my_widgets.dart';
import 'menu_page.dart';
import 'notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int subjectCardsNo = 0;
  double subjectCardsWidth = 0,subjectCardsBorderRadius = 0, subjectCardsSpacing = 0, subjectCardsMinWidth = 0, subjectCardsIconMaxWidth = 0;

  Widget subjectCard(int n) {
    return GestureDetector(
      onTap: () {
        MyValues.selected["subject"] = MyValues.selected["course"]["subjects"][n];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectPage()));
      },
      child: Container(
        alignment: Alignment.center,
        width: subjectCardsWidth,
        padding: EdgeInsets.all(subjectCardsBorderRadius),
        decoration: BoxDecoration(
          color: MyValues.selected["course"]["subjects"][n]["color"],
          borderRadius: BorderRadius.circular(subjectCardsBorderRadius),
        ),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(MyValues.selected["course"]["subjects"][n]["icon location"], width: subjectCardsIconMaxWidth,),
            ),
            const SizedBox(height: 8,),
            Text(
              MyValues.selected["course"]["subjects"][n]["title"],
              style: TextStyle(
                color: MyColors.myLight,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ],
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
    MyValues.appMargin = 30;
    subjectCardsSpacing = 15;
    subjectCardsMinWidth = 110;
    subjectCardsBorderRadius = 20;
    subjectCardsIconMaxWidth = 70;
    if(MyValues.deviceWidth > 600) {
      MyValues.appMargin = 50;
    }
    if(MyValues.deviceWidth > 1000) {
      MyValues.appMargin = 50;
      subjectCardsSpacing = 25;
      subjectCardsMinWidth = 210;
      subjectCardsBorderRadius = 20;
      subjectCardsIconMaxWidth = 100;
    }
    subjectCardsNo = (MyValues.deviceWidth - (2*MyValues.appMargin) + subjectCardsSpacing) ~/ (subjectCardsMinWidth + subjectCardsSpacing);
    subjectCardsWidth = ( MyValues.deviceWidth - (2*MyValues.appMargin) - ((subjectCardsNo-1)*subjectCardsSpacing) )/subjectCardsNo;


    return Scaffold(
      appBar: MyWidgets.myAppBarEmpty(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(MyValues.appMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(MyValues.deviceWidth > 600) MyWidgets.myAppTitle(),
                  const Expanded(child: SizedBox(),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
                    },
                    child: Icon(
                      Icons.notifications_rounded,
                      color: MyColors.myMenuItem,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Builder(builder: (context){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
                      },
                      child: Icon(
                        Icons.menu,
                        color: MyColors.myMenuItem,
                      ),
                    );
                  }),
                ],
              ),
              if(MyValues.deviceWidth <= 600) const SizedBox(height: 30,),
              if(MyValues.deviceWidth <= 600) MyWidgets.myAppTitle(),
              const SizedBox(height: 50,),
              Text(
                MyValues.selected["course"]["title"],
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4,),
              Text(
                MyValues.selected["course"]["sub title"],
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(height: 30,),
              Wrap(
                runSpacing: subjectCardsSpacing,
                spacing: subjectCardsSpacing,
                children: [
                  for(int i=0;i<(MyValues.selected["course"]["subjects"].length);i++) subjectCard(i),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
