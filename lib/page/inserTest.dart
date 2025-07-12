import 'dart:io';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/navigator_bar.dart';
import 'package:flutter_course/function/getNutrient.dart';
import 'package:flutter_course/my_flutter_app_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

import 'insertAlreadyTest.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodInsert()
    );throw UnimplementedError();
  }
}


class FoodInsert extends StatefulWidget {
  //const Food({super.key});
  @override
  State<FoodInsert> createState() => _FoodInsertState();
}

class _FoodInsertState extends State<FoodInsert> {
  File? _image;
  final picker = ImagePicker();


  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }
  
  void _createMeal() async {
    Meal meal = Meal(
        date: DateTime.now(), 
        time: TimeOfDay.now(), 
        image: Image.file(_image!));
    
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodInsertAlready()));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int countMeal = 1;

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: FoodBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //2nd box
            Container(
              height: 65,
              width: 400,
              alignment: Alignment.center,
              child: Text("เพิ่มข้อมูลใหม่",
                style: TextStyle(color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  //backgroundColor: Colors.white
                ),
              ),
            ),

            //4th box
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  //color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 333,
                          width: 320,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Scrollbar(
                            //trackVisibility: true,
                              thumbVisibility: true,
                              thickness: 10,
                              radius: Radius.circular(20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    SizedBox(height: 20,),
                                    Container(child: Text("มื้อที่ " + countMeal
                                        .toString(),
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        //backgroundColor: Colors.white
                                      ),
                                    )),
                                    Container(child: Text("เวลา " +
                                        (now.hour).toString() + ":" +
                                        (now.minute)
                                            .toString(),
                                      style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        //backgroundColor: Colors.white
                                      ),
                                    )),
                                    SizedBox(height: 20,),

                                    _image == null
                                    //if _image == null, this container have been execute.
                                        ? Container(
                                          child: new Column(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_a_photo_outlined,
                                                  size: 200,),
                                                onPressed: () =>
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (
                                                          BuildContext context) =>
                                                          AlertDialog(
                                                              title: Center(
                                                                child: Text(
                                                                    "Picture"),),
                                                              content: new Container(
                                                                width: 250,
                                                                height: 100,
                                                                child: new Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          10, 0, 0,
                                                                          20),
                                                                      child: SingleChildScrollView(
                                                                        scrollDirection: Axis
                                                                            .horizontal,
                                                                        child: new SizedBox(
                                                                          width: 200,
                                                                          height: 40,
                                                                          child: TextButton(
                                                                            onPressed: () {
                                                                              getImageCamera();
                                                                              Navigator
                                                                                  .pop(
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
                                                                          10, 0, 0,
                                                                          0),
                                                                      child: new SizedBox(
                                                                        width: 200,
                                                                        height: 40,
                                                                        child: TextButton(
                                                                          onPressed: () {
                                                                            getImageGallery();
                                                                            Navigator
                                                                                .pop(
                                                                                context);
                                                                          },
                                                                          child: Text(
                                                                              "Select Picture"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                          ),
                                                    ),
                                              ),
                                            ],
                                          ),
                                    )

                                    //if _image != null, this container have been execute.
                                        : new Container(
                                          child: new Column(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10.0),
                                                // adjust the border radius to your liking
                                                child: Image(
                                                  image: FileImage(_image!),
                                                  fit: BoxFit.cover,
                                                  width: 300.0,
                                                  // adjust the width to your liking
                                                  height: 200.0, // adjust the height to your liking
                                                ),
                                              ),
                                            ],
                                          ),
                                    ),
                                    //CheckNutrition(),
                                  ],
                                ),
                              )
                          )
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}