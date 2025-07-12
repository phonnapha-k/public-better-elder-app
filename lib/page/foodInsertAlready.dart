import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/BetterElderr-Application/page/exercise.dart';
import 'package:flutter_course/BetterElderr-Application/page/food_insert_already.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/excerciseBar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: FoodInsertAlready());
  }
}

///This program is use to taking picture and detail for daily journal  of meal in Better Elder Application.
///   , this FoodInsertAlreadyPage is an first page of FoodInsertAlready insert, it's implement FoodInsertAlreadyInsert class to insert meal photo
///This FoodInsertAlready program have 2 sub class there are FoodInsertAlready class and _FoodInsertAlreadyState Class
///FoodInsertAlready Class is calling _FoodInsertAlreadyState Class only to show the Widget
///_FoodInsertAlreadyState Class is implement 1 method there is build method to build context in Widget
///
/// Author:Phonnapha.K
/// Date:May 31, 2024
///
///This class show Widget of this FoodInsertAlreadyPage that is the first page of FoodInsertAlready insert
class FoodInsertAlready extends StatefulWidget {
  @override
  State<FoodInsertAlready> createState() => _FoodInsertAlreadyState();
}

///This class is custom Widget of this FoodInsertAlreadyPage, there are 5 column of context.
///   First column is the Header Bar ,the text of bar is "บันทึกการทานอาหาร"
///   Second column is the date bar ,that show date of the day that user operate
///   Third column is text column ,to tell user about their behavior, for example text "วันนี้คุณยังไม่บันทึกอาหาร"
///   Fourth column is expanded column, this column is action container to accept pressed
///       action from user and change to page add meal by using Elevated Button and call FoodInsertAlreadyInsert class
///   Fifth column is column spare for future function, that is share function
///
class _FoodInsertAlreadyState extends State<FoodInsertAlready> {
  DateTime now = DateTime.now();
  int countMeal = 1;
  Image imageMeal = Image.asset('assets/foodExample.png');
  String nameMeal = "ข้าวผัดหมู";
  int caloriesMeal = 1000;
  List<String> ingredient = [
    "ข้าว",
    "หมู",
    "น้ำมัน",
    "น้ำมัน",
    "น้ำมัน",
    "น้ำมัน"
  ];
  String ingredientMeal =
      "ข้าว, หมู, น้ำมัน, น้ำมัน, น้ำมัน, น้ำมัน ข้าว, หมู, น้ำมัน, น้ำมัน, น้ำมัน, น้ำมัน ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: new FoodBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///1st
          ///Container ช่องหัวข้อ
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(20),
                //color: Colors.blueGrey,
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "เพิ่มข้อมูลใหม่",
                          style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 320,
                          //color: Colors.blue,
                          child: Text(
                            "มื้อที่ " + countMeal.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 320,
                          //color: Colors.yellow,
                          child: Text(
                            DateFormat('HH:mm')
                                .format(DateTime.now())
                                .toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 165,
                          width: 320,
                          //color: Colors.orange,
                          child: imageMeal,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          width: 320,
                          //color: Colors.yellow,
                          child: Text(
                            ("เมนู : ") +
                                nameMeal +
                                '\n' +
                                "พลังงาน : " +
                                caloriesMeal.toString() +
                                " KCAL" +
                                '\n' +
                                "ส่วนผสม : " +
                                ingredientMeal,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                            ),
                            strutStyle: StrutStyle(
                              leading: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/wrong.png",
                    height: 50,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      "assets/right.png",
                      height: 50,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
