import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/app_Bar.dart';

import 'package:intl/intl.dart';

class PressureLasted extends StatefulWidget {
  final Color color_ball;
  final String sbp, dbp;
  PressureLasted(
      {super.key,
      required this.color_ball,
      required this.sbp,
      required this.dbp});

  @override
  State<PressureLasted> createState() => _PressureLastedState();
}

class _PressureLastedState extends State<PressureLasted> {
  final dateInput = new TextEditingController();
  late Color ball;
  String status = "";
  IconData ballIcon = Icons.sentiment_satisfied_alt;

  var arrData = [
    {
      'color': Colors.white,
      'status': 'สุขภาพดี',
      'icon': Icons.sentiment_very_satisfied
    },
    {
      'color': Colors.lightGreen,
      'status': 'ปกติ',
      'icon': Icons.sentiment_satisfied_alt
    },
    {
      'color': Colors.green,
      'status': 'กลุ่มเสี่ยง',
      'icon': Icons.sentiment_very_satisfied
    },
    {
      'color': Colors.yellow,
      'status': 'เฝ้าระวัง',
      'icon': Icons.sentiment_very_satisfied
    },
    {
      'color': Colors.orange,
      'status': 'อันตราย',
      'icon': Icons.sentiment_dissatisfied
    },
    {
      'color': Colors.red,
      'status': 'ขั้นวิกฤติ',
      'icon': Icons.sentiment_very_dissatisfied
    },
    {
      'color': Colors.black,
      'status': 'โรคแทรกซ้อน',
      'icon': Icons.sentiment_very_dissatisfied
    }
  ];

  void ballData() {
    if (ball == Colors.white) {
      status = 'สุขภาพดี';
      ballIcon = Icons.sentiment_very_satisfied;
    } else if (ball == Colors.lightGreen) {
      status = 'ปกติ';
      ballIcon = Icons.sentiment_satisfied_alt;
    } else if (ball == Colors.green) {
      status = 'กลุ่มเสี่ยง';
      ballIcon = Icons.sentiment_very_satisfied;
    } else if (ball == Colors.yellow[900]) {
      status = 'เฝ้าระวัง';
      ballIcon = Icons.sentiment_neutral_rounded;
    } else if (ball == Colors.orange) {
      status = 'อันตราย';
      ballIcon = Icons.sentiment_dissatisfied;
    } else if (ball == Colors.red) {
      status = 'ขั้นวิกฤติ';
      ballIcon = Icons.sentiment_very_dissatisfied;
    } else {
      status = 'โรคแทรกซ้อน';
      ballIcon = Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  void initState() {
    dateInput.text = DateFormat('วันที่ dd เดือน MM ปี yyyy')
        .format(DateTime.now()); //set the initial value of text field
    super.initState();
    ball = widget.color_ball;
    ballData();
    // status = "";
    // ballIcon = Icons.abc_outlined;
    //locationItem_Controller.text = itemID.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(),
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.76,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                // Date DD/MM/YYYY
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
          //Ping Pong Result
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  status,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  ballIcon,
                  size: MediaQuery.of(context).size.height * 0.1,
                  color: ball,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //SBP card
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  'ความดันบน',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.sbp.toString(),
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " mmHg",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                )
                ////// SBP value
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //DBP card
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  'ความดันล่าง',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.dbp.toString(),
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " mmHg",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ////// DBP value
              ],
            ),
          ),

          //share button
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

class ItemLocationManager {
  final Map<String, String> _itemLocationMap;

  // Constructor to initialize the map
  ItemLocationManager(this._itemLocationMap);

  // Method to get the item by location
  String getItemByLocation(String location) {
    return _itemLocationMap[location] ?? 'Item not found';
  }

  // Method to get the location by item
  String getLocationByItem(String item) {
    return _itemLocationMap.entries
        .firstWhere((entry) => entry.value == item,
            orElse: () => MapEntry('Location not found', ''))
        .key;
  }

  // Method to add a new item-location pair
  void addItemLocation(String location, String item) {
    _itemLocationMap[location] = item;
  }

  // Method to remove an item-location pair by location
  void removeItemByLocation(String location) {
    _itemLocationMap.remove(location);
  }

  // Method to remove an item-location pair by item
  void removeItemByItem(String item) {
    _itemLocationMap.removeWhere((key, value) => value == item);
  }

  @override
  String toString() {
    return _itemLocationMap.toString();
  }
}
/*
void main() {
  final Map<String, String> initialData = {
    'white': 'สุขภาพดี',
    'light-green': 'ปกติ',
    'green': 'กลุ่มเสี่ยง',
    'yellow': 'เฝ้าระวัง',
    'orange': 'อันตราย',
    'red': 'ขั้นวิกฤติ',
    'black': 'โรคแทรกซ้อน',
  };

  ItemLocationManager manager = ItemLocationManager(initialData);

  // Displaying the initial map
  //print('Initial Map: $manager');

  // Getting an item by location
  print('Item at Location1: ${manager.getItemByLocation('white')}');

  // Getting a location by item
  //print('Location of Item2: ${manager.getLocationByItem('Item2')}');

  // Adding a new item-location pair
  //manager.addItemLocation('Location4', 'Item4');
  //print('After adding Location4: $manager');

  // Removing an item-location pair by location
  //manager.removeItemByLocation('Location1');
  //print('After removing Location1: $manager');

  // Removing an item-location pair by item
  //manager.removeItemByItem('Item3');
  //print('After removing Item3: $manager');
}
*/