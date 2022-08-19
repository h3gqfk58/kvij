import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/pages/quiz_page.dart';
import '../my_data/my_widgets.dart';

class QuizLoadingPage extends StatefulWidget {
  const QuizLoadingPage({key}) : super(key: key);
  @override
  State<QuizLoadingPage> createState() => _QuizLoadingPageState();
}

class _QuizLoadingPageState extends State<QuizLoadingPage> {

  int quizStartTimeCounter = 3;
  Timer quizStartTimer = Timer(const Duration(seconds: 0), () {});

  int loadingQuizState = 0, notifyingFriendState = 0, waitingFriendState = 0;

  runQuizStartTimer() {
    if(quizStartTimeCounter <= 0) {
      Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => const QuizPage() ));
    }
    else {
      quizStartTimer = Timer(const Duration(seconds: 1), () {
        setState(() {
          quizStartTimeCounter--;
        });
        runQuizStartTimer();
      });
    }
  }

  loadQuiz() async {
    setState(() {
      loadingQuizState = 1;
    });
    setState(() {
      loadingQuizState = 2;
    });
  }

  notifyFriend() {
    setState(() {
      notifyingFriendState = 1;
    });
    setState(() {
      notifyingFriendState = 2;
    });
  }

  waitFriend() {
    setState(() {
      waitingFriendState = 1;
    });
    setState(() {
      waitingFriendState = 2;
    });
  }

  startProcess() async {
    await loadQuiz();
    if(MyValues.selected["contacts"].length > 0) {
      await notifyFriend();
      await waitFriend();
    }
    runQuizStartTimer();
  }

  Widget processesStates(String process) {

    int state = 0;

    if(process == "loading quiz") {
      state = loadingQuizState;
    }
    else if(process == "notifying friend") {
      state = notifyingFriendState;
    }
    else if(process == "waiting friend") {
      state = waitingFriendState;
    }

    if(state == 1) {
      return Container(
        height: 25,
        width: 25,
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(3),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: MyColors.myBlue,
        ),
      );
    }
    else if(state == 2) {
      return Container(
        height: 25,
        width: 25,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.check,
          color: MyColors.myGreen,
          size: 22,
        ),
      );
    }
    else {
      return Container(
        height: 25,
        width: 25,
        margin: const EdgeInsets.only(right: 20),
      );
    }
  }

  @override
  void dispose() {
    quizStartTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startProcess();
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
              const SizedBox(height: 40,),
              Row(
                children: [
                  processesStates("loading quiz"),
                  const Text(
                    "Loading Quiz",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                  )
                ],
              ),
              if(MyValues.selected["contacts"].length > 0) const SizedBox(height: 15,),
              if(MyValues.selected["contacts"].length > 0) Row(
                children: [
                  processesStates("notifying friend"),
                  const Flexible(
                    child: Text(
                      "Notifying your Friend",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                    ),
                  )
                ],
              ),
              if(MyValues.selected["contacts"].length > 0) const SizedBox(height: 15,),
              if(MyValues.selected["contacts"].length > 0) Row(
                children: [
                  processesStates("waiting friend"),
                  const Flexible(
                    child: Text(
                      "Waiting for your Friend",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 60,),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.myTeal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Quiz starts in",
                        style: TextStyle(
                          color: MyColors.myLight,
                          fontSize: 20,
                          letterSpacing: 0.2,
                          wordSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Text(
                        quizStartTimeCounter.toString(),
                        style: TextStyle(
                          color: MyColors.myLight,
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        "second(s)",
                        style: TextStyle(
                          color: MyColors.myLight,
                          fontSize: 15,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 5,),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
