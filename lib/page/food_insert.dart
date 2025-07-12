import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_course/BetterElderr-Application/page/food.dart';
import 'package:flutter_course/page/food.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:image_picker/image_picker.dart';
import '../function/getNutrient.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: FoodInsert());
  }
}

///This program is add meal picture in Better Elder Application. It has an AlertDialog to accept
///   choice to import picture from user, there are camera or select from memory. After choose or taking picture
///   , they will stay in this page and running the process to getting nutrition and show in FoodInsertAlready class
///This FoodInsert program have 2 sub class there are FoodInsert class and _FoodInsertState Class
///FoodInsert Class is calling _FoodInsertState Class only to show the Widget
///_FoodInsertState Class is implement 2 method there are getImageGallery(), getImageCamera() and
///   build method to build context in Widget and 2 field there are _image and picker
///
/// Author:Phonnapha.K
/// Date:May 31, 2024
///
///This class show Widget of FoodInsert page
class FoodInsert extends StatefulWidget {
  @override
  State<FoodInsert> createState() => _FoodInsertState();
}

///This class is control class , build widget, use function or method
class _FoodInsertState extends State<FoodInsert> {
  ///_image field is contain image that user pick up.
  ///picker field is wait for user pick image.
  /// String? _menuName;
  int? _calories;

  File? _image;
  final picker = ImagePicker();
  final String apiKey = '870528f2a6ce4157b33005f591020eef';
  //'717d9b7f9fcf4222ad008e6e17860e97'; //จะใช้ก่อน @gmail.com // Replace with your API key
  //'870528f2a6ce4157b33005f591020eef' //@kkumail.com
  String? _result;
  double? _cal_result;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  //String timeString = DateFormat('HH:mm').format(tim);
  int countMeal = 1;
  late Color cancelSignColor = Colors.red;
  late Color okaySignColor = Colors.green;
  bool isImageSelected = false;
/*
  ///function waiting picture from gallery
  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        ///calling Meal
        final Meal meal =
            Meal(date: dateTime, image: Image.file(_image!), time: timeOfDay);
        meal.getImage(FileImage(_image!));
        print(meal.date);
        print(meal.time.toString());
        print(meal.calories.toString());
        print(meal.name);
        print(meal.nutrients);
      } else {
        print("No Image Picked");
      }
    });
  }

  ///function waiting picture from camera
  Future getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Meal(date: dateTime, image: Image.file(_image!), time: timeOfDay);
      } else {
        print("No Image Picked");
      }
    });
  }
*/

  @override
  void initState() {
    super.initState();
  }

  Future _getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          _result = null;
          //isImageSelected = true;
        });
        _analyzeImage();
        //Meal(date: dateTime, image: Image.file(_image!), time: timeOfDay);
      } else {
        _result = ("No Image Picked");
      }
    });
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _result = null;
        //isImageSelected = true;
      });
      _analyzeImage();
    } else {
      _result = ("No Image Picked");
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    final mimeType = lookupMimeType(_image!.path);
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://api.spoonacular.com/food/images/analyze?apiKey=$apiKey'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        _image!.path,
        contentType: MediaType.parse(mimeType!),
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      setState(() {
        _result = data['category']['name'];
        _cal_result = data['nutrition']['calories']['value'];
      });
    } else {
      setState(() {
        _result = 'ERROR';
      });
      //throw Exception('Failed to analyze image');
    }
  }

  ///build widget function for FoodInsert and AlertDialog
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],

        ///Application Bar have change, not the same as home page, .
        appBar: FoodBar(),

        ///have 2 container
        ///text container and active container.
        body: Column(
            //color: Colors.amber,

            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///2th box
              Expanded(
                child: ListView(padding: EdgeInsets.all(20), children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Text(
                              "เพิ่มข้อมูลใหม่",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          _image == null
                              ? IconButton(
                                  icon: Icon(
                                    Icons.image_rounded,
                                    size:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  onPressed: () {
                                    //_getImage();
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              title: Center(
                                                child: Text("Picture"),
                                              ),
                                              content: new Container(
                                                width: 250,
                                                height: 100,
                                                child: new Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 20),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: new SizedBox(
                                                          width: 200,
                                                          height: 40,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              _getImageCamera();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                "Take Picture"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: new SizedBox(
                                                        width: 200,
                                                        height: 40,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            _getImage();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                              "Select Picture"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    );
                                  },
                                )
                              : Container(
                                  padding: EdgeInsets.all(15),
                                  child: Image.file(_image!),
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                ),
                          _result == null
                              ? Text(
                                  'เพิ่มภาพเพื่อวิเคราะห์',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                )
                              : Column(
                                  children: [
                                    Text(
                                      'เมนู: $_result',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                    ),
                                    Text(
                                      'แคลเลอรี่: $_cal_result' + " cal",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                    )
                                  ],
                                ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
                  _image != null && _result != null
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //handleCancelNext();
                                  if (_image != null) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              title: Center(
                                                child: Text("Picture"),
                                              ),
                                              content: new Container(
                                                width: 250,
                                                height: 100,
                                                child: new Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 20),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: new SizedBox(
                                                          width: 200,
                                                          height: 40,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              _getImageCamera();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                "Take Picture"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: new SizedBox(
                                                        width: 200,
                                                        height: 40,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            _getImage();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                              "Select Picture"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    );
                                  }
                                },
                                child: Image.asset(
                                  "assets/wrong.png",
                                  height: 50,
                                  alignment: Alignment.bottomLeft,
                                  //color: cancelSignColor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                              TextButton(
                                  onPressed: () {
                                    //handleCancelNext();
                                    if (_image != null) {
                                      /*
                                      Navigator.pop(context, {
                                        'menuName': _result ?? '',
                                        'calories': _calories ?? 0,
                                        'image': _image,
                                        */
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FoodHome(
                                                    noMeal: countMeal,
                                                    menuName:
                                                        _result.toString(),
                                                    calories:
                                                        _cal_result!.toInt(),
                                                    image: _image!,
                                                  )));

                                      /*
                                      FoodHome(
                                        noMeal: countMeal,
                                        menuName: _result.toString(),
                                        calories: 400,
                                        image: _image!,
                                      );
                                      */
                                      /*
                                      Navigator.pop(context, {
                                        'menuName': _result ?? '',
                                        'calories': _calories ?? 0,
                                        'image': _image,
                                      });
                                      */

                                      /*
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FoodHome(
                                                    noMeal: countMeal,
                                                    menuName:
                                                        _result.toString(),
                                                    calories: 400,
                                                    image: _image!,
                                                  )));
                                      */

                                      /*
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => FoodHome(
                                                    noMeal: countMeal,
                                                    menuName:
                                                        _result.toString(),
                                                    calories: 400,
                                                    image: _image!,
                                                  )));
                                                  */
                                    }
                                  },
                                  child: Image.asset(
                                    "assets/right.png",
                                    height: 50,
                                    //color: okaySignColor,
                                  ))
                            ],
                          ))
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                ]),
              ),
            ]));
  }
}
