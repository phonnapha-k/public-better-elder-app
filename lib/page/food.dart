import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/excerciseBar.dart';
import 'package:flutter_course/page/food_insert.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodHome(
          noMeal: 0,
          menuName: '',
          calories: 0,
          image: null as File,
        ));
  }
}

///This program is use to taking picture and detail for daily journal  of meal in Better Elder Application.
///   , this FoodInsertDonePage is an first page of FoodHome insert, it's implement FoodInsertDoneInsert class to insert meal photo
///This FoodHome program have 2 sub class there are FoodHome class and _FoodInsertDoneState Class
///FoodHome Class is calling _FoodInsertDoneState Class only to show the Widget
///_FoodInsertDoneState Class is implement 1 method there is build method to build context in Widget
///
/// Author:Phonnapha.K
/// Date:May 31, 2024
///
///This class show Widget of this FoodInsertDonePage that is the first page of FoodHome insert
class FoodHome extends StatefulWidget {
  final String menuName;
  final int calories;
  final int noMeal;
  final File image;

  const FoodHome(
      {super.key,
      required this.noMeal,
      required this.menuName,
      required this.calories,
      required this.image});

  @override
  State<FoodHome> createState() => _FoodInsertDoneState();
}

///This class is custom Widget of this FoodInsertDonePage, there are 5 column of context.
///   First column is the Header Bar ,the text of bar is "บันทึกการทานอาหาร"
///   Second column is the date bar ,that show date of the day that user operate
///   Third column is text column ,to tell user about their behavior, for example text "วันนี้คุณยังไม่บันทึกอาหาร"
///   Fourth column is expanded column, this column is action container to accept pressed
///       action from user and change to page add meal by using Elevated Button and call FoodInsertDoneInsert class
///   Fifth column is column spare for future function, that is share function
///
class _FoodInsertDoneState extends State<FoodHome> {
  final dateInput = new TextEditingController();

  @override
  void initState() {
    dateInput.text = DateFormat('วันที่ dd เดือน MM ปี yyyy')
        .format(DateTime.now()); //set the initial value of text field
    super.initState();
    //locationItem_Controller.text = itemID.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: ApplicationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///1st
          ///Container ช่องหัวข้อ
          Container(
            padding: EdgeInsets.all(10),
            //color: Colors.grey[200],
            alignment: Alignment.center,
            //width: 400,
            child: Text(
              "บันทึกการทานอาหาร",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.76,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                  //height: 84,
                  child: TextField(
                      textAlign: TextAlign.center,
                      controller: dateInput,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        //labelText: "Enter Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('วันที่ dd เดือน MM ปี yyyy')
                                  .format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        }
                      }),
                ),
              ],
            ),
          ),
          Container(
            height: 65,
            width: 400,
            //color: Colors.grey[400],
            child: Text(
              "วันนี้คุณยังไม่บันทึกอาหาร",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                //backgroundColor: Colors.white
              ),
            ),
            alignment: Alignment.center,
          ),
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(10),
                //color: Colors.blueGrey,
                children: [
                  widget.noMeal == 0
                      ? SizedBox()
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height * 0.36,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("มื้อที่ " + widget.noMeal.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Text(widget.menuName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    Text(widget.calories.toString() + " cal",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))
                                  ]),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child: Image.file(widget.image as File),
                              ),
                            ],
                          ),
                        ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodInsert(),
                            ));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 5),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          size: 100,
                          color: Colors.black,
                        ),
                        alignment: Alignment.center,
                      )),
                ]),
          ),
          Container(
            height: 80,
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(24)),
              child: Text(
                "-แบ่งปันข้อมูล-",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              alignment: Alignment.center,
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
