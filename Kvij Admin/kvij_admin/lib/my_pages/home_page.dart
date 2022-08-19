import 'package:flutter/material.dart';
import '../my_data/my_colors.dart';
import '../my_data/my_values.dart';
import '../my_data/my_widgets.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MyValues.deviceWidth = MediaQuery.of(context).size.width;
    MyValues.deviceHeight = MediaQuery.of(context).size.height;
    MyValues.appMargin = 30;

    if(MyValues.deviceWidth > 600) {
      MyValues.appMargin = 50;
    }
    if(MyValues.deviceWidth > 1000) {
      MyValues.appMargin = 50;
    }

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuPage()));
                    },
                    child: Icon(
                      Icons.menu,
                      color: MyColors.myMenuItem,
                    ),
                  ),
                ],
              ),
              if(MyValues.deviceWidth <= 600) const SizedBox(height: 30,),
              if(MyValues.deviceWidth <= 600) MyWidgets.myAppTitle(),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
