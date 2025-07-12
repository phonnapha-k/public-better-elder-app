import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/BetterElderr-Application/page/home.dart';
import 'package:flutter_course/component/AppBarFoodInsert.dart';
import 'package:flutter_course/my_flutter_app_icons.dart';
import 'package:flutter_course/page/testGoRoute.dart';
import 'package:image_picker/image_picker.dart';

import 'homePicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Picker App",
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: Home(),
    );
  }
}
