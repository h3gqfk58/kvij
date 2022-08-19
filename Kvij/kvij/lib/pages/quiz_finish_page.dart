import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import '../my_data/my_widgets.dart';

class QuizFinishPage extends StatefulWidget {
  const QuizFinishPage({key}) : super(key: key);
  @override
  State<QuizFinishPage> createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {

  double stars = 0;

  @override
  void initState() {
    stars = (MyValues.quizUserScore * 5) / MyValues.quizTotalScore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MyValues.deviceWidth = MediaQuery.of(context).size.width;
    MyValues.deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyWidgets.myAppBarEmpty(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: MyColors.myGrey,
        isExtended: true,
        label: const Text("Back to Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(MyValues.appMargin),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                (MyValues.selected["contacts"].length > 0) ?
                (MyValues.quizUserScore > MyValues.quizFriendScore) ? ClipRRect(
                  child: Image.asset("assets/images/icon_9_won.png", width: 200,),
                ) : (MyValues.quizUserScore < MyValues.quizFriendScore) ? ClipRRect(
                  child: Image.asset("assets/images/icon_10_lose.png", width: 200,),
                ) : ClipRRect(
                  child: Image.asset("assets/images/icon_11_draw.png", width: 200,),
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=1;i<=5;i++) Icon(
                      (i<=stars) ? Icons.star_rounded : ((i-1)<stars) ? Icons.star_half_rounded : Icons.star_border_rounded,
                      size: 45,
                      color: MyColors.myStars,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                if(MyValues.selected["contacts"].length > 0) Text(
                  (MyValues.quizUserScore > MyValues.quizFriendScore) ? "You Won."
                      : (MyValues.quizUserScore < MyValues.quizFriendScore) ? "You Lost" : "It's a Draw",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Your Score",
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              MyValues.quizUserScore.toString() + "/" + MyValues.quizTotalScore.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                    ),
                    if(MyValues.selected["contacts"].length > 0) Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Friend's Score",
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              MyValues.quizFriendScore.toString() + "/" + MyValues.quizTotalScore.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 60,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
