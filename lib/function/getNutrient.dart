///Add countMeal
import 'package:flutter/material.dart';
import 'package:flutter_course/BetterElderr-Application/page/food_insert.dart';
import 'package:flutter_course/BetterElderr-Application/page/food_insert_already.dart';

class Meal {
  late final DateTime date;
  late final TimeOfDay time;
  late final Image image;
  late final String name;
  late final int calories;
  late final Map<String, int> nutrients;

  Meal({required this.date, required this.time, required this.image }){
    this.date ;
    this.time ;
    this.image ;
    this.name = getName();
    this.calories = getCalories();
    this.nutrients = getNutrients();
  }


  int getCalories() {
    return 1700;
  }

  void getImage(FileImage imageFile) {
    getNutrients();
  }

  Map<String, int> getNutrients() {
    return {'car' : 1700};
  }

  bool isHealthyForElder() {
    return true;
  }

  String getName() {
      return "ข้าวผัด";
  }

}

