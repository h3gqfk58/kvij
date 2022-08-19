import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:kvij_teacher/my_data/my_colors.dart';
import 'package:kvij_teacher/my_data/my_values.dart';

class EditPage extends StatefulWidget {
  const EditPage({key}) : super(key: key);
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  //String a= r"<h2>Flutter  \( \rm\\TeX \)</h2>", b = r"When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$";
  TextEditingController textEditingController = TextEditingController();
  String renderText = "";

  @override
  void initState() {
    textEditingController.text = MyValues.selected["question or option"];
    renderText = textEditingController.text;
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
          },
          isExtended: true,
          backgroundColor: MyColors.myGrey,
          label: const Text("Temporary"),
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
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          renderText = textEditingController.text;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18,),
                        decoration: BoxDecoration(
                          color: const Color(0xff507ea1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Render",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MyColors.myLight,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18,),
                        decoration: BoxDecoration(
                          color: const Color(0xff507ea1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: MyColors.myLight,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35,),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 300.0,
                  ),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Text",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.myDark, width: 2),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 35,),
                const Text(
                  "Rendered Content : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 15,),
                TeXView(
                  child: TeXViewDocument(renderText,),
                ),
                /*const SizedBox(height: 30,),
                TeXView(
                  child: TeXViewDocument(a,),
                ),
                const SizedBox(height: 5,),
                TeXView(
                  child: TeXViewDocument(b,),
                ),*/
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
