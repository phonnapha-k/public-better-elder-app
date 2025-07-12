import 'dart:async';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/excerciseBar.dart';
import 'package:flutter_course/page/doneExercise.dart';
import 'package:flutter_course/page/exercise.dart';
import 'package:flutter_course/testGneral.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DoingExercise(
          nameAct: "เดินเร็ว",
          calAct: 460,
        ));
  }
}

///This program is use to taking picture and detail for daily journal  of meal in Better Elder Application.
///   , this DoingExercisePage is an first page of DoingExercise insert, it's implement DoingExerciseInsert class to insert meal photo
///This DoingExercise program have 2 sub class there are DoingExercise class and _DoingExerciseState Class
///DoingExercise Class is calling _DoingExerciseState Class only to show the Widget
///_DoingExerciseState Class is implement 1 method there is build method to build context in Widget
///
/// Author:Phonnapha.K
/// Date:May 31, 2024
///
///This class show Widget of this DoingExercisePage that is the first page of DoingExercise insert
class DoingExercise extends StatefulWidget {
  final String nameAct;
  final int calAct;

  const DoingExercise({super.key, required this.nameAct, required this.calAct});

  @override
  State<DoingExercise> createState() => _DoingExerciseState();
}

///This class is custom Widget of this DoingExercisePage, there are 5 column of context.
///   First column is the Header Bar ,the text of bar is "บันทึกการทานอาหาร"
///   Second column is the date bar ,that show date of the day that user operate
///   Third column is text column ,to tell user about their behavior, for example text "วันนี้คุณยังไม่บันทึกอาหาร"
///   Fourth column is expanded column, this column is action container to accept pressed
///       action from user and change to page add meal by using Elevated Button and call DoingExerciseInsert class
///   Fifth column is column spare for future function, that is share function
///
class _DoingExerciseState extends State<DoingExercise> {
  late Stopwatch stopwatch;
  late IconData playIcon;
  late Timer t;
  late Color cancelSignColor;
  late Color okaySignColor;

  late String activityName;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      playIcon = Icons.play_circle_fill_rounded;
      cancelSignColor = Colors.red;
      okaySignColor = Colors.green;
    } else {
      stopwatch.start();
      playIcon = Icons.stop_circle_rounded;
      cancelSignColor = Colors.transparent;
      okaySignColor = Colors.transparent;
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000)
        .toString()
        .padLeft(3, "0"); // this one for the miliseconds
    String seconds = ((milli ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hour = (((milli ~/ 1000) ~/ 60) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the minute

    return "$hour:$minutes:$seconds.$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    playIcon = Icons.play_circle_rounded;
    cancelSignColor = Colors.transparent;
    okaySignColor = Colors.transparent;
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    activityName = widget.nameAct;
  }

  @override
  void dispose() {
    t?.cancel();
    super.dispose();
  }

  double calculateEnergyBurn() {
    int energyPerHour = widget.calAct;
    String startTimeStr = "00:00:00.000";
    String endTimeStr = returnFormattedText(); // HH:mm:ss format

    // Convert the time strings to DateTime objects
    DateTime startTime = _parseTime(startTimeStr);
    DateTime endTime = _parseTime(endTimeStr);

    // Calculate the duration between the two times
    Duration duration = endTime.difference(startTime);

    // Calculate the energy burned
    double energyBurned = (duration.inMinutes / 60) * energyPerHour;

    print("Energy burned: $energyBurned kcal");

    return energyBurned;
  }

  DateTime _parseTime(String timeStr) {
    final format = DateFormat.Hms(); // HH:mm:ss format
    return format.parse(timeStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: new ExerciseBar(),
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
                    height: MediaQuery.of(context).size.height * 0.5,
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
                          //decoration: BoxDecoration(color: Colors.amber),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_walk_rounded,
                                size: MediaQuery.of(context).size.height * 0.1,
                                color: Colors.black,
                              ),
                              Text(
                                this.activityName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                maxLines: 3,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "ระยะเวลา",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              Text(
                                returnFormattedText(),
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              /*
                              Text(
                                "ระยะทาง",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              */
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: IconButton(
                            onPressed: () {
                              handleStartStop();
                            },
                            icon: Icon(
                              playIcon,
                              size: MediaQuery.of(context).size.height * 0.1,
                              color: stopwatch.isRunning
                                  ? Colors.red[900]
                                  : Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (!stopwatch.isRunning) {
                              stopwatch.reset();
                            }
                          },
                          child: Image.asset(
                            "assets/wrong.png",
                            height: 50,
                            alignment: Alignment.bottomLeft,
                            color: cancelSignColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        TextButton(
                            onPressed: () {
                              if (!stopwatch.isRunning) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Exercise(
                                            calBurned: calculateEnergyBurn())));
                              }
                            },
                            child: Image.asset(
                              "assets/right.png",
                              height: 50,
                              color: okaySignColor,
                            ))
                      ],
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
