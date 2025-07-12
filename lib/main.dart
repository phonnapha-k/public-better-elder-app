import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/component/navigator_bar.dart';
import 'package:flutter_course/page/exercise.dart';
import 'package:flutter_course/page/food.dart';
import 'package:flutter_course/page/home.dart';
import 'package:flutter_course/page/pressure.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

///This is the main program of Better Elder Application
///This main program have 2 sub class there are Home class and _HomePageState Class
///Home Class is calling _HomePageState Class to use state in the class,for current index = 0 ,it is HomePage State
///_HomePageState Class is implement 2 variable there is _currentIndex(initial = 0) that is Integer and page that is List of widget.
///     _HomePageState class has 2 methods implement there is navigateBottomBar that accept 1 argument: index that is integer to set _currentIndex to show the Widget that right for index.
///     and second method is built the Widget follow the _currentIndex
///
/// Author:Phonnapha.K
/// Date:May 30, 2024
///
///Home class call _HomePageState to create state
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

///_HomePageState class has call widget follow the _currentIndex
class _HomePageState extends State<Home> {
  int _currentIndex = 0;
  File? file;
  final List<Widget> page = [
    HomePage(),
    Pressure(),
    FoodHome(
        noMeal: 0,
        menuName: '',
        calories: 0,
        // ignore: cast_from_null_always_fails
        image: File('')),
    Exercise(
      calBurned: 0.0,
    )
  ];

  ///this class is set index follow _currentIndex to
  ///   do Navigation Bar show the right state follow current index
  void navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],

      ///Navigate class is the class that do Navigation Bottom Bar,
      ///   it's accept index argument for use navigateBottomBar method
      bottomNavigationBar: Navigate(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
