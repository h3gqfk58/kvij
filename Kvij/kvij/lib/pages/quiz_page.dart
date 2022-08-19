import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/pages/quiz_finish_page.dart';
import '../my_data/my_widgets.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({key}) : super(key: key);
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int quizTimerCounter = 0;
  Timer quizTimer = Timer(const Duration(seconds: 0), () {});

  int currentQuizBlockNumber = 1;
  bool currentQuizBlockIsAnswered = false;

  runQuizTimer() {
    if(quizTimerCounter == 0) {
      setState(() {
        currentQuizBlockIsAnswered = true;
      });
    }
    if(currentQuizBlockIsAnswered) {
      quizTimer = Timer(const Duration(seconds: 3), () {
        MyValues.quizTotalScore = (MyValues.quizTotalScore + MyValues.quizBlocks[currentQuizBlockNumber-1]["weight"]).toInt();
        if(currentQuizBlockNumber == MyValues.quizBlocks.length) {
          Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => const QuizFinishPage() ));
        }
        else {
          setState(() {
            currentQuizBlockIsAnswered = false;
            currentQuizBlockNumber++;
            quizTimerCounter = MyValues.quizBlocks[currentQuizBlockNumber-1]["time"];
          });
          runQuizTimer();
        }
      });
    }
    else {
      quizTimer = Timer(const Duration(seconds: 1), () {
        setState(() {
          quizTimerCounter--;
        });
        runQuizTimer();
      });
    }
  }


  Widget questionBlock() {
    return Text(
      MyValues.quizBlocks[currentQuizBlockNumber-1]["question"],
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
        height: 1.2,
      ),
    );
  }

  Widget optionBlock(int optionNumber) {

    return GestureDetector(
      onTap: () {
        if(!currentQuizBlockIsAnswered) {
          setState(() {
            currentQuizBlockIsAnswered = true;
            MyValues.quizUserSelectedAnswers[currentQuizBlockNumber-1] = optionNumber;
            if(MyValues.quizBlocks[currentQuizBlockNumber-1]["correct option"] == optionNumber) {
              MyValues.quizUserScore = (MyValues.quizUserScore + MyValues.quizBlocks[currentQuizBlockNumber-1]["weight"]).toInt();
            }
          });
        }
      },
      child: Container(
        width: MyValues.deviceWidth - (2*MyValues.appMargin),
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: ( (currentQuizBlockIsAnswered) && (MyValues.quizBlocks[currentQuizBlockNumber-1]["correct option"] == optionNumber) ) ? MyColors.myAnswerCorrect :
            ((currentQuizBlockIsAnswered) && (MyValues.quizUserSelectedAnswers[currentQuizBlockNumber-1] == optionNumber)) ? MyColors.myAnswerWrong : MyColors.myTranslucentDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          MyValues.quizBlocks[currentQuizBlockNumber-1]["options"][optionNumber-1],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
            color: ( (currentQuizBlockIsAnswered) && ((MyValues.quizBlocks[currentQuizBlockNumber-1]["correct option"] == optionNumber)||(MyValues.quizUserSelectedAnswers[currentQuizBlockNumber-1] == optionNumber)) ) ? MyColors.myLight : MyColors.myDark,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    quizTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    MyValues.quizTotalScore = 0;
    MyValues.quizUserScore = 0;
    MyValues.quizFriendScore = 0;
    MyValues.quizUserSelectedAnswers = [];
    for(int i=0;i<MyValues.quizBlocks.length;i++) {
      MyValues.quizUserSelectedAnswers.add(0);
    }
    quizTimerCounter = MyValues.quizBlocks[currentQuizBlockNumber-1]["time"];
    runQuizTimer();
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Score",
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              MyValues.quizUserScore.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: MyColors.myDark,
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              quizTimerCounter.toString(),
                              style: TextStyle(
                                color: MyColors.myDark,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          currentQuizBlockNumber.toString() + " of " + MyValues.quizBlocks.length.toString(),
                          style: TextStyle(
                            color: MyColors.myDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: (MyValues.selected["contacts"].length>0) ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Friend's Score",
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                MyValues.quizFriendScore.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              questionBlock(),
              const SizedBox(height: 25,),
              for(int i=1;i<=4;i++) optionBlock(i),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
