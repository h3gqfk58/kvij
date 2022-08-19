import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvij_teacher/my_data/my_colors.dart';
import 'package:kvij_teacher/my_data/my_values.dart';
import 'list_page.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({key}) : super(key: key);
  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

  Widget chapterBlock(int n) {
    return GestureDetector(
      onTap: () {
        MyValues.selected["chapter"] = MyValues.selected["subject"]["chapters"][n-1];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
      },
      child: Container(
        color: MyColors.myTransparent,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text(
              n.toString() + ".",
              style: const TextStyle(
                letterSpacing: 0.1,
              ),
            ),
            const SizedBox(width: 9,),
            Text(
              MyValues.selected["subject"]["chapters"][n-1],
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                letterSpacing: 0.1,
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

    return Scaffold(
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
              Container(
                width: MyValues.deviceWidth - (2*MyValues.appMargin),
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                  color: MyValues.selected["subject"]["color"],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        ClipRRect(
                          child: Image.asset(MyValues.selected["subject"]["icon location"], width: 60),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            MyValues.selected["subject"]["title"],
                            style: TextStyle(
                              color: MyColors.myLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                children: const [
                  Text(
                    "Chapters",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              for(int i=1;i<=MyValues.selected["subject"]["chapters"].length;i++) chapterBlock(i),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
