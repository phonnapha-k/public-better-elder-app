import 'package:flutter/material.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/page/pressure_stt.dart';
import 'package:flutter_course/page/presure_stt_voice.dart';
import 'package:intl/intl.dart';

class Pressure extends StatefulWidget {
  const Pressure({Key? key}) : super(key: key);

  @override
  State<Pressure> createState() => _Pressurestate();
}

class _Pressurestate extends State<Pressure> {
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
          //1st box
          Container(
            height: 80,
            //color: Colors.grey[200],
            alignment: Alignment.center,
            //width: 400,
            child: const Text(
              "ความดันวันนี้",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),

          //2nd box
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
          //3rd box
          Container(
            height: 65,
            width: 400,
            //color: Colors.grey[400],
            child: Text(
              "วันนี้คุณยังไม่ได้วัดความดัน",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                //backgroundColor: Colors.white
              ),
            ),
            alignment: Alignment.center,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //4th box
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PresureSttVoice()),
                      );
                    },
                    child: Icon(
                      Icons.mic,
                      color: Colors.black54,
                      size: 50,
                    )),
              ), //5th box
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PressureStt()),
                      );
                    },
                    child: Icon(
                      Icons.dialpad_rounded,
                      color: Colors.black54,
                      size: 50,
                    )),
              ),
            ],
          ),

          //6th box
          Container(
            height: 80,
            child: Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
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
          //),
        ],
      ),
      /*
        bottomNavigationBar: Navigate(
          onTabChange: (index) => navigateBottomBar(index),
        ),
      */ //body
    );
  }
}
