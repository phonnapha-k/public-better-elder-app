import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/BetterElderr-Application/page/exercise.dart';
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
        debugShowCheckedModeBanner: false, home: DoneExercise());
  }
}

///This program is use to taking picture and detail for daily journal  of meal in Better Elder Application.
///   , this DoingExercisePage is an first page of DoneExercise insert, it's implement DoingExerciseInsert class to insert meal photo
///This DoneExercise program have 2 sub class there are DoneExercise class and _DoingExerciseState Class
///DoneExercise Class is calling _DoingExerciseState Class only to show the Widget
///_DoingExerciseState Class is implement 1 method there is build method to build context in Widget
///
/// Author:Phonnapha.K
/// Date:May 31, 2024
///
///This class show Widget of this DoingExercisePage that is the first page of DoneExercise insert
class DoneExercise extends StatefulWidget {
  @override
  State<DoneExercise> createState() => _DoingExerciseState();
}

///This class is custom Widget of this DoingExercisePage, there are 5 column of context.
///   First column is the Header Bar ,the text of bar is "บันทึกการทานอาหาร"
///   Second column is the date bar ,that show date of the day that user operate
///   Third column is text column ,to tell user about their behavior, for example text "วันนี้คุณยังไม่บันทึกอาหาร"
///   Fourth column is expanded column, this column is action container to accept pressed
///       action from user and change to page add meal by using Elevated Button and call DoingExerciseInsert class
///   Fifth column is column spare for future function, that is share function
///
class _DoingExerciseState extends State<DoneExercise> {
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
              "บันทึกการออกกำลังกาย",
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.76,
            padding: EdgeInsets.all(10),
            child: Center(
              //mainAxisAlignment: MainAxisAlignment.center,
              child: Text(
                "400 kCal",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    //fontSize: MediaQuery.of(context).size.height * 0.03),
                    fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(10),
                //color: Colors.blueGrey,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.36,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_walk_rounded,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "เดินจ๊อกกิ้ง",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.36,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pedal_bike_rounded,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            "ปั่นจักรยาน",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.36,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
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
