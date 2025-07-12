import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:image_picker/image_picker.dart';
import '../function/getNutrient.dart';
import 'package:intl/intl.dart';

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
  File? _image;
  final picker = ImagePicker();
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  //String timeString = DateFormat('HH:mm').format(tim);
  int countMeal = 1;

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

  ///build widget function for FoodInsert and AlertDialog
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],

        ///Application Bar have change, not the same as home page, .
        appBar: FoodBar(),

        ///have 2 container
        ///text container and active container.
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///1st box
              ///activity text container
              Container(
                height: 65,
                width: 400,
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

              ///2th box
              Expanded(
                  child: Column(
                children: [
                  Scrollbar(
                      thumbVisibility: true,
                      thickness: 10,
                      radius: Radius.circular(20),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,

                          ///this container contain icon button and show picture from picker
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            width: 320,
                            height: 333,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ///SizedBox is make space between container
                                SizedBox(
                                  height: 20,
                                ),

                                ///1st Text container that contain sequence of meal
                                Container(
                                    child: Text(
                                  "มื้อที่ " + countMeal.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    //backgroundColor: Colors.white
                                  ),
                                )),

                                /// 2nd Text container that contain time of taking meal
                                Container(
                                    child: Text(
                                  DateFormat('HH:mm')
                                      .format(DateTime.now())
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                )),

                                ///make space between container
                                SizedBox(
                                  height: 20,
                                ),

                                ///3rd icon button and show picture from picker
                                ///this container will choose 2 state of container
                                ///   there are output when image doesn't import and output when image import already
                                ///   check by _image == null, if's true it will execute first container but if it's false that's mean
                                ///   user import image already, it's will execute the second container
                                _image == null

                                    ///if _image == null, this container have been execute.
                                    ///   this container implement AlertDialog for get choice
                                    ? Container(
                                        child: new Column(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                Icons.add_a_photo_outlined,
                                                size: 200,
                                              ),
                                              onPressed: () =>
                                                  showDialog<String>(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                        title: Center(
                                                          child:
                                                              Text("Picture"),
                                                        ),
                                                        content: new Container(
                                                          width: 250,
                                                          height: 100,
                                                          child: new Column(
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        20),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      new SizedBox(
                                                                    width: 200,
                                                                    height: 40,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        getImageCamera();
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
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    new SizedBox(
                                                                  width: 200,
                                                                  height: 40,
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      getImageGallery();
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    ///if _image != null, this container have been execute.
                                    ///   and this container will call get nutrition method or FoodInsertAlready class
                                    : Container(
                                        child: new Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  10.0), // adjust the border radius to your liking
                                              child: Image(
                                                image: FileImage(_image!),
                                                fit: BoxFit.cover,
                                                width:
                                                    300.0, // adjust the width to your liking
                                                height:
                                                    200.0, // adjust the height to your liking
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          )))
                ],
              ))
            ],
          ),
        ));
  }
}
