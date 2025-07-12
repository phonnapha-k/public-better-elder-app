import 'dart:core';
import 'dart:ffi';
//import 'dart:ffi';
//import 'dart:js_interop';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/page/pressure_lasted.dart';
//import 'dart:core' as String;

class PressureResult extends StatefulWidget {
  final String sbp, lbp;
  const PressureResult({super.key, required this.sbp, required this.lbp});

  @override
  State<PressureResult> createState() => _PressureResultState();
}

class _PressureResultState extends State<PressureResult> {
  late int sbp_value, dbp_value;
  TextEditingController _sbpIn = TextEditingController();
  TextEditingController _dbpIn = TextEditingController();
  late Color icon_color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sbpIn.text = widget.sbp;
    _dbpIn.text = widget.lbp;

    icon_color = Colors.transparent;
  }

  int StringConvert(String text) {
    String value = text;

    int num = int.parse(value);
    return num;
  }

  void FunctionCalculate() {
    sbp_value = StringConvert(_sbpIn.text);
    dbp_value = StringConvert(_dbpIn.text);

    if (sbp_value >= 140 && dbp_value < 90) {
      print("ISH: black color");
      icon_color = Colors.black; //black
    } else if (sbp_value >= 180 && dbp_value >= 110) {
      print("Hypertension LV2: red color");

      print("convert :");
      print(StringConvert(_sbpIn.text));
      print(" \n value :");
      sbp_value = StringConvert(_sbpIn.text);
      print(sbp_value); //print(_sbpIn.text);
      icon_color = Colors.red; //red
    } else if ((sbp_value >= 160 && dbp_value <= 179) ||
        (dbp_value >= 100 && dbp_value <= 109)) {
      print("Hypertension LV2: orange color"); //orange
      icon_color = Colors.orange;
    } else if ((sbp_value >= 140 && sbp_value <= 159) ||
        (dbp_value >= 90 && dbp_value <= 99)) {
      print("Hypertension LV1: yellow color"); //yellow
      icon_color = Colors.yellow;
    } else if ((sbp_value >= 130 && sbp_value <= 139) ||
        (dbp_value >= 85 && dbp_value <= 89)) {
      print("High Normal: green color"); //green
      icon_color = Colors.green;
    } else if ((sbp_value >= 120 && sbp_value <= 129) ||
        (dbp_value >= 80 && dbp_value <= 84)) {
      print("Normal : light-green color"); //light-green
      icon_color = Colors.lightGreen;
    } else if (sbp_value < 120 && dbp_value < 80) {
      print("Optimal : white color");
      icon_color = Colors.white; //white
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: ApplicationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              enabled: false,
              controller: _sbpIn,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "SBP"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              enabled: false,
              controller: _dbpIn,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "LBP"),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(50),
              ),
              onPressed: () async {
                setState(() {
                  sbp_value = _sbpIn.hashCode;
                  dbp_value = _dbpIn.hashCode;
                });
                FunctionCalculate();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => PressureLasted(
                            color_ball: icon_color,
                            sbp: _sbpIn.text,
                            dbp: _dbpIn.text,
                          )),
                );
              },
              child: Text("ยืนยันข้อมูล"),
            ),
          )
        ],
      ),
    );
  }
}
