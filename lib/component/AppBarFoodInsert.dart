import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodBar extends StatelessWidget implements PreferredSizeWidget {
  FoodBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("บันทึกการทานอาหาร"),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
