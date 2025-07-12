import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/page/exercise.dart';

class ExerciseBar extends StatelessWidget implements PreferredSizeWidget {
  ExerciseBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("บันทึกการออกกำลังกาย"),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      /* leading: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Exercise(calBurned: 0.0)));
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),*/
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
