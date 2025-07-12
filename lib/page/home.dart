import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

///This is the HomePage program of Better Elder Application
///This HomePage program have 2 sub class there are HomePage class and _HomePageState Class
///HomePage Class is implement 2 method there are HomePage method and createState method
///_HomePageState Class is implement 1 method there is build context method to build widget HomePage
///
/// Author:Phonnapha.K
/// ##This Program is Pick making
///
/// Date:May 30, 2024
///
/// This class is used to call widget HomePage to show
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

///This class is build HomePage Widget by calling ApplicationBar class to make appBar
///   and make body without implement bottom navigation bar
class _HomePageState extends State<HomePage> {
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
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                //color: Colors.grey[200],
                alignment: Alignment.center,
                //width: 400,
                child: Text(
                  "อรุณสวัสดิ์ คุณสายมณี",
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
                padding: EdgeInsets.all(10),
                //color: Colors.amber,
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/woman.jpg"), fit: BoxFit.fill),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                //height: MediaQuery.of(context).size.height * 0.06,
                //width: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.grey[400],
/*
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height,
                    child: ClipOval(child: Image.asset("woman.jpg")),
                  ),
                ),*/
                alignment: Alignment.center,
              ),
              Container(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'ข้อมูลสุขภาพวันนี้',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      //color: Colors.blueAccent,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10),
                                  color: Colors.black38,
                                  blurRadius: 5),
                            ]),
                        child: Column(
                          children: [
                            Text(
                              'ความดันล่าสุด',
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '120',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      '80',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.sentiment_very_satisfied_rounded,
                                  color: Colors.green,
                                  size:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                Text(
                                  'ปกติ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                color: Colors.black38,
                                blurRadius: 5),
                          ]),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'แคลอรี่วันนี้',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '500',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '/2000',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'kCal',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    "แนะนำการใช้งาน",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ]));
  }
}
