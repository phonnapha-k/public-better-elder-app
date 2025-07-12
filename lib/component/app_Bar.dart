import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  ApplicationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("BETTER ELDER"),
      backgroundColor: Colors.blueGrey[500],
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
