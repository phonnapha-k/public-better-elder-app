import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/navigator_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../function/getNutrient.dart';


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodInsertAlready()
    );throw UnimplementedError();
  }
}


class FoodInsertAlready extends StatefulWidget {
  //Image image = Image.asset('assets/foodExample.png');
  final Meal meal = Meal(date: DateTime.now(), time: TimeOfDay.now(), image: Image.asset('assets/foodExample.png'));
  //FoodInsertAlready({required this.meal});

  @override
  State<FoodInsertAlready> createState() => _FoodInsertAlreadyState();
}

class _FoodInsertAlreadyState extends State<FoodInsertAlready>{

  //late final DateTime dateTime ;
  //late final TimeOfDay timeOfDay;
  //late final Image imageMeal;
  final int countMeal = 1;

  //late final String nameMeal;
  //late final int caloriesMeal = 1000;
  //late final <String> ingredient =  ["ข้าว", "หมู", "น้ำมัน", "น้ำมัน", "น้ำมัน", "น้ำมัน"];
  //String ingredientMeal =  "ข้าว, หมู, น้ำมัน, น้ำมัน, น้ำมัน, น้ำมัน ข้าว, หมู, น้ำมัน, น้ำมัน, น้ำมัน, น้ำมัน ";


  @override
  Widget build(BuildContext context) {
    //meal = Meal(date: dateTime, time: timeOfDay, image: imageMeal);

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: FoodBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 65,
                width: 400,
                alignment: Alignment.center,
                child: Text("เพิ่มข้อมูลใหม่",
                  style: TextStyle(color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                    children: [
                      Container(
                        height: 450,
                        child: Scrollbar(
                          //trackVisibility: true,
                            thumbVisibility: true,
                            thickness: 10,
                            radius: Radius.circular(20),

                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 320,
                                    //color: Colors.blue,
                                    child: Text("มื้อที่ " + countMeal.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30,),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 320,
                                    //color: Colors.yellow,
                                    child: Text("เวลา "+ (widget.meal.time.hour).toString() + ":" + (widget.meal.time.minute).toString() ,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25,),),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 165,
                                    width: 320,
                                    //color: Colors.orange,
                                    child: widget.meal.image ,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 320,
                                    //color: Colors.yellow,
                                    child: Text(("เมนู : ") + widget.meal.name + '\n' + "พลังงาน : " + widget.meal.calories.toString() + " KCAL" + '\n' + "ส่วนผสม : " + widget.meal.nutrients.toString(),
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 25,),
                                      strutStyle: StrutStyle(
                                        leading: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      Container(
                          height: 70,
                          width: 330,
                          //color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/wrong.png", height: 50, alignment: Alignment.bottomLeft,),
                              //space between 2 image
                              Container(
                                child: Text("                               "),
                              ),
                              Image.asset("assets/right.png", height: 50,)
                            ],
                          )
                      ),
                    ]
                ),
              ),
            ],
          )
      )
      ,
    );
  }
}

/*
child:Column(
                children: [
                  Ex
                  ///ส่วนข้อมูล
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                Container(
                child:Container(
                child: Text("มื้อที่ " + countMeal.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30,) ,) ),

          Container(
            child: Text("เวลา "+ (now.hour).toString() + ":" + (now.minute).toString() ,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20,)
            ),
            Container(
              //color: Colors.blue,
              child: imageMeal,
            ),
            Container(
                child: Text("เมนู : " + nameMeal + '\n' + "พลังงาน : " + caloriesMeal.toString() + " KCAL" + '\n' + "ส่วนผสม : " + ingredientMeal,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20,
                  ) ,
                )
            ),
          ),
        ],Container(child: Text("เวลา "+ (now.hour).toString() + ":" + (now.minute).toString() ,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20,
          //backgroundColor: Colors.white
        ) ,
      ))
        ,)
                  ),
                  ///ส่วนเครื่องหมายถูกผิด
                  Container(
                    height: 50,
                    color: Colors.red,
                  )
                ],
          ),
        ],
* */

/*
child: Column(
              children: [
                Scrollbar(
                  thickness: 20,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                            //ข้อความลำดับที่มื้อ
                        Container(
                            child: Text("มื้อที่ " +  countMeal.toString(),
                              style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ) ,
                            )
                        ),
                            //ข้อความเวลา
                        Container(
                            child: Text("เวลา "+ (now.hour).toString() + ":" + (now.minute).toString() ,
                              style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            )
                        ),
                        //ช่องรูปภาพ
                        Container(
                            child: imageMeal
                        ),
                        //รายละเอียด
                        Container(
                          child: Text("เมนู : " + nameMeal + '\n' + "พลังงาน : " + caloriesMeal.toString() + " KCAL" + '\n' + "ส่วนผสม : " + ingredientMeal,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //)
                    ),
                ),

                Container(
                  color: Colors.white,
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/wrong.png", height: 50,),
                        Image.asset("assets/right.png", height: 50,)],
                    )
                ),
              ],
            )
 */