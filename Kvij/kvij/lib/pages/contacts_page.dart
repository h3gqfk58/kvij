import 'package:flutter/material.dart';
import 'package:kvij/my_data/my_colors.dart';
import 'package:kvij/my_data/my_values.dart';
import 'package:kvij/pages/quiz_loading_page.dart';
import '../my_data/my_widgets.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({key}) : super(key: key);
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  List isContactSelectedList = [];

  Widget contactBlock(int n) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isContactSelectedList[n-1] = !isContactSelectedList[n-1];
        });
      },
      child: Container(
        color: MyColors.myTransparent,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.myAccountPicture,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: MyColors.myLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Icon(
                    Icons.account_box_rounded,
                    color: MyColors.myAccountPicture,
                    size: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 13,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyValues.contacts[n-1]["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 3,),
                Text(
                  MyValues.contacts[n-1]["phone number"],
                  style: const TextStyle(
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox(),),
            const SizedBox(width: 15,),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: (isContactSelectedList[n-1]) ? MyColors.myGreen : MyColors.myTranslucentDarker,
              ),
              child: Icon(
                Icons.check_rounded,
                color: (isContactSelectedList[n-1]) ? MyColors.myLight : MyColors.myTransparent,
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
    for(int i=0;i<MyValues.contacts.length;i++) {
      isContactSelectedList.add(false);
    }
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
          MyValues.selected["contacts"] = [];
          for(int i=0;i<MyValues.contacts.length;i++) {
            if(isContactSelectedList[i] == true) {
              MyValues.selected["contacts"].add(i+1);
            }
          }
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QuizLoadingPage()));
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
                  const Text(
                    "Contacts",
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
                        for(int i=0;i<MyValues.contacts.length;i++) {
                          isContactSelectedList[i] = false;
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
                        for(int i=0;i<MyValues.contacts.length;i++) {
                          isContactSelectedList[i] = true;
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
              for(int i=1;i<=MyValues.contacts.length;i++) contactBlock(i),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
