import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import '../my_data/my_widgets.dart';
import 'contacts_page.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({key}) : super(key: key);
  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

  double playWithCardsWidth = 0,playWithCardsBorderRadius = 0;

  List isChapterSelectedList = [];

  Widget chapterBlock(int n) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChapterSelectedList[n-1] = !isChapterSelectedList[n-1];
        });
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
                MyValues.selected["subject"]["chapters"][n-1],
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: (isChapterSelectedList[n-1]) ? MyColors.myGreen : MyColors.myTranslucentDarker,
              ),
              child: Icon(
                Icons.check_rounded,
                color: (isChapterSelectedList[n-1]) ? MyColors.myLight : MyColors.myTransparent,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    for(int i=0;i<MyValues.selected["subject"]["chapters"].length;i++) {
      isChapterSelectedList.add(true);
    }
    MyValues.selected["setting"] = MyValues.selected["subject"]["settings"][0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MyValues.deviceWidth = MediaQuery.of(context).size.width;
    MyValues.deviceHeight = MediaQuery.of(context).size.height;

    playWithCardsWidth = (MyValues.deviceWidth - 118)/2;
    playWithCardsBorderRadius = 28;

    return Scaffold(
      appBar: MyWidgets.myAppBarEmpty(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          MyValues.selected["chapters"] = [];
          for(int i=0;i<MyValues.selected["subject"]["chapters"].length;i++) {
            if(isChapterSelectedList[i] == true) {
              MyValues.selected["chapters"].add(i+1);
            }
          }
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ContactsPage()));
        },
        backgroundColor: MyColors.myGrey,
        isExtended: true,
        label: const Text("Next"),
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
                    const SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,),
                        decoration: BoxDecoration(
                          color: MyColors.myTranslucentLight,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          underline: Container(),
                          dropdownColor: MyColors.myGrey,
                          borderRadius: BorderRadius.circular(15),
                          focusColor: MyColors.myLight,
                          iconEnabledColor: MyColors.myLight,
                          value: MyValues.selected["setting"],
                          items: MyValues.selected["subject"]["settings"].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:TextStyle(
                                  color: MyColors.myLight,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              MyValues.selected["setting"] = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  const Text(
                    "Chapters",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for(int i=0;i<MyValues.selected["subject"]["chapters"].length;i++) {
                          isChapterSelectedList[i] = false;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for(int i=0;i<MyValues.selected["subject"]["chapters"].length;i++) {
                          isChapterSelectedList[i] = true;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.playlist_add_check_rounded,
                      size: 22,
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
