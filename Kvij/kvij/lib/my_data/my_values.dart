import 'dart:ui';

class MyValues {
  static double deviceWidth = 0;
  static double deviceHeight = 0;
  static double appMargin = 30;

  static bool myUserIsSignedIn = false;
  static String myUserPhoneNumber = "";
  static String myUserName = "";

  static var courses = [
    {
      "title" : "Karnataka state board",
      "sub title" : "Class 10",
      "subjects" : [
        {
          "title" : "English",
          "color" : const Color(0xFFDC9041),
          "icon location" : "assets/images/icon_1_English.png",
          "settings" : [
            "1st Language",
            "2nd Language",
          ],
          "chapters" : [
            "Old Boy",
            "A great road",
            "The blue bottle",
            "News paper lied",
            "Wifi not working",
            "Sun is dark",
            "Come far away",
            "Numbers and letters",
            "Alphabets",
            "I like banana",
            "Grammar",
            "Black and White",
          ],
        },
        {
          "title" : "Kannada",
          "color" : const Color(0xFF80AA4F),
          "icon location" : "assets/images/icon_2_Kannada.png",
          "settings" : [
            "1st Language",
            "2nd Language",
          ],
          "chapters" : [],
        },
        {
          "title" : "Hindi",
          "color" : const Color(0xFF856B9A),
          "icon location" : "assets/images/icon_3_Hindi.png",
          "settings" : [
            "1st Language",
            "2nd Language",
          ],
          "chapters" : [],
        },
        {
          "title" : "Maths",
          "color" : const Color(0xFF569C74),
          "icon location" : "assets/images/icon_4_Maths.png",
          "settings" : [
            "English Medium",
            "Kannada Medium",
          ],
          "chapters" : [
            "Addition",
            "Subtraction",
            "Compound Interest",
            "LCM and HCF",
            "Multiplication",
            "Division",
            "Algebra",
            "Linear equations",
            "Graphs",
            "Quadratic equations",
            "Matrices",
            "Determinants",
          ],
        },
        {
          "title" : "Science",
          "color" : const Color(0xFF72A5B1),
          "icon location" : "assets/images/icon_5_Science.png",
          "settings" : [
            "English Medium",
            "Kannada Medium",
          ],
          "chapters" : [
            "Newtons laws",
            "Force",
            "Pressure",
            "Work",
            "Energy",
            "Gears",
            "Kinetic Energy",
            "Temperature",
            "Human Body",
            "Molecules and Compounds",
            "Organic Compounds",
            "Atoms",
          ],
        },
        {
          "title" : "Social",
          "color" : const Color(0xFFCD5A5A),
          "icon location" : "assets/images/icon_6_Social.png",
          "settings" : [
            "English Medium",
            "Kannada Medium",
          ],
          "chapters" : [
            "Indian Independence",
            "Mountains of India",
            "Platues of India",
            "Rivers of India",
            "Minerals in India",
            "Central Government",
            "State Government",
            "The President of India",
            "The Prime minister of India",
            "The Constitution of India",
            "National Festivals of India",
            "Economy",
          ],
        },
      ],
    },
  ];
  static List contacts = [
    {
      "name" : "Arun Kumar",
      "phone number" : "+91 9383767364",
    },
    {
      "name" : "Baghya Shree",
      "phone number" : "+91 9383767364",
    },
    {
      "name" : "Charan T R",
      "phone number" : "+91 9383767364",
    },
    {
      "name" : "Ravi J",
      "phone number" : "+91 9383767364",
    },
    {
      "name" : "Shiva D",
      "phone number" : "+91 9383767364",
    },
    {
      "name" : "Venkatesh Hanuma",
      "phone number" : "+91 9383767364",
    },
  ];
  static List quizBlocks = [
    {
      "question" : "This is Question 1. This is a demo Question, don't take it seriously, this doesn't affect your grade",
      "options" : [
        "This is Option 1",
        "This is Option 2",
        "This is Option 3",
        "This is Option 4",
      ],
      "correct option" : 1,
      "time" : 20,
      "weight" : 1,
    },
    {
      "question" : "This is Question 2.",
      "options" : [
        "This is Option 1",
        "This is Option 2",
        "This is Option 3",
        "This is Option 4",
      ],
      "correct option" : 2,
      "time" : 20,
      "weight" : 1,
    },
    {
      "question" : "This is Question 3.",
      "options" : [
        "This is Option 1",
        "This is Option 2",
        "This is Option 3",
        "This is Option 4",
      ],
      "correct option" : 3,
      "time" : 20,
      "weight" : 1,
    },
    {
      "question" : "This is Question 4.",
      "options" : [
        "This is Option 1",
        "This is Option 2",
        "This is Option 3",
        "This is Option 4",
      ],
      "correct option" : 4,
      "time" : 20,
      "weight" : 1,
    },
    {
      "question" : "This is Question 5. This is a demo Question, don't take it seriously, this doesn't affect your grade",
      "options" : [
        "This is Option 1",
        "This is Option 2",
        "This is Option 3",
        "This is Option 4",
      ],
      "correct option" : 1,
      "time" : 20,
      "weight" : 1,
    },
  ];

  static Map selected = {
    "course" : MyValues.courses[0],
    "subject" : {},
    "setting" : "",
    "chapters" : [],
    "contacts" : [],
  };

  static int quizTotalScore = 0;
  static int quizUserScore = 0;
  static int quizFriendScore = 0;
  static List quizUserSelectedAnswers = [];

}