import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/BetterElderr-Application/page/food_insert_already.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:flutter_course/component/app_Bar.dart';
import 'package:flutter_course/component/navigator_bar.dart';
import 'package:flutter_course/my_flutter_app_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AddStadium()
    );throw UnimplementedError();
  }
}


class AddStadium extends StatefulWidget {
  //const Food({super.key});
  @override
  State<AddStadium> createState() => _AddStadiumState();
}

class _AddStadiumState extends State<AddStadium> {
  File? _image;
  final picker = ImagePicker();

  _getFromGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80
    );

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }

  _getFromCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80
    );

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int countMeal = 1;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: FoodBar(),
      body: Center(
          child: _image == null
              ? new Container(
                child: new Column(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100.0,
                    ),

                    Container(
                      child: new Column(
                        children: <Widget>[
                          IconButton(
                            icon : Icon(Icons.add_a_photo_outlined),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                AlertDialog(
                                  title: Center( child: Text("Picture"),),
                                  content: new Container(
                                    width: 250,
                                    height: 100,
                                    child: new Column(
                                    children: <Widget> [
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: new SizedBox(
                                            width: 200,
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                _getFromCamera();
                                                Navigator.pop(context);
                                              },
                                              child: Text("Take Picture"),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: new SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: TextButton(
                                          onPressed: (){
                                            _getFromGallery();
                                            Navigator.pop(context);
                                          },
                                          child: Text("Select Picture"),
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
              ],
            ),
          )
              : new Container(
                  child: new Column(
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage: new FileImage(_image!),
                        radius: 100.0,
                      )
                    ],
                  ),
          )
      ),
      /*
      bottomNavigationBar: GNav(
        tabBackgroundColor: Colors.white, // selected tab background color
        haptic: true, // haptic feedback
        tabBorderRadius: 0,
        gap: 8, // the tab button gap between icon and text
        color: Colors.white, // unselected icon color
        activeColor: Colors.blueGrey[700], // selected icon and text color
        iconSize:50 , // tab button icon size
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5), // navigation bar padding
        tabs: [
          GButton( icon: MyFlutterApp.hm_01),
          GButton( icon: MyFlutterApp.bp_01,),
          GButton( icon: MyFlutterApp.food_01,),
          GButton( icon: MyFlutterApp.ex_01,)],
        ),
      */
      /*
      bottomNavigationBar: Navigate(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      */
    );
  }
}


