import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/page/pressure_result.dart';
import 'package:intl/intl.dart';

class PressureStt extends StatefulWidget {
  const PressureStt({Key? key}) : super(key: key);

  @override
  State<PressureStt> createState() => _PressureSttState();
}

class _PressureSttState extends State<PressureStt> {
  final TextEditingController _sbpIn = new TextEditingController();
  final TextEditingController _dbpIn = new TextEditingController();
  late String sbp, dbp;
  var imagePP = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: ApplicationBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(50),
                child: TextField(
                  controller: _sbpIn,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'SBP',
                    hintText: "กดที่นี่เพื่อใส่ความดันบน",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: TextField(
                  controller: _dbpIn,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'DBP',
                    hintText: "กดที่นี่เพื่อใส่ความดันล่าง",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(50),
                  ),
                  onPressed: () async {
                    setState(() {
                      sbp = _sbpIn.text;
                      dbp = _dbpIn.text;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              PressureResult(sbp: sbp, lbp: dbp)),
                    );
                  },
                  child: Text("ถัดไป"),
                ),
              )
            ]));
  }
}
