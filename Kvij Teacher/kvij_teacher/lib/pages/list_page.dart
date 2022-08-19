import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvij_teacher/my_data/my_colors.dart';
import 'package:kvij_teacher/my_data/my_values.dart';
import 'package:kvij_teacher/pages/quiz_block_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({key}) : super(key: key);
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Widget quizBlockBlock(int n) {
    return GestureDetector(
      onTap: () {
        MyValues.selected["quiz block"] = MyValues.quizBlocks[n-1];
        Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizBlockPage()));
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
            Expanded(
              child: Text(
                MyValues.quizBlocks[n-1]["question"],
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.1,
                ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          MyValues.selected["quiz block"] = {
            "question" : "",
            "options" : [
              "",
              "",
              "",
              "",
            ],
            "correct option" : 0,
            "time" : 0,
            "weight" : 0,
          };
          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizBlockPage()));
        },
        backgroundColor: MyColors.myGrey,
        isExtended: true,
        label: const Icon(
          Icons.add_rounded,
        ),
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
              Row(
                children: [
                  Text(
                    MyValues.selected["chapter"],
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              for(int i=1;i<=MyValues.quizBlocks.length;i++) quizBlockBlock(i),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
