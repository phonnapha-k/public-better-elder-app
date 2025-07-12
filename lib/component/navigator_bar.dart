import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/my_flutter_app_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigate extends StatelessWidget {
  void Function(int)? onTabChange;
  Navigate({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.blueGrey[700],
      child: GNav(
        tabBackgroundColor: Colors.white, // selected tab background color
        haptic: true, // haptic feedback
        tabBorderRadius: 0,
        gap: 8, // the tab button gap between icon and text
        color: Colors.white, // unselected icon color
        activeColor: Colors.blueGrey[700], // selected icon and text color
        iconSize: 100, // tab button icon size
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.width *
                0.02), // navigation bar padding
        tabs: [
          GButton(
            icon: MyFlutterApp.hm_01,
          ),
          GButton(
            icon: MyFlutterApp.bp_01,
          ),
          GButton(
            icon: MyFlutterApp.food_01,
          ),
          GButton(
            icon: MyFlutterApp.ex_01,
          )
        ],
        onTabChange: (index) => onTabChange!(index),
      ),
    );
  }
}


/*
Container(
      height: 70,
      color: Colors.blueGrey[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home, color: Colors.white, size: 55,),
          Icon(Icons.monitor_heart, color: Colors.white, size: 55,), //color: Colors.white,size: 10),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new Food()),
                );
              },
              icon: Icon(Icons.food_bank_rounded, color: Colors.white, size: 55)
          ),
          IconButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => new Exercise()),);},
              icon: Icon(Icons.fitness_center, color: Colors.white, size: 55,)
          )
        ],
      ),
    )
 */

/*
Container(
      color: Colors.grey,
      //height: 0,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.blueGrey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 16,
        //onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
          icon: Icons.home,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Exercise()),
              );
            },
          ),
          GButton(
            icon: Icons.monitor_heart,),
          GButton(
            icon: Icons.food_bank_outlined,),
          GButton(
            icon: Icons.work,)
        ],

      ),
    );
 */
/*
GNav(
  rippleColor: Colors.grey[800], // tab button ripple color when pressed
  hoverColor: Colors.grey[700], // tab button hover color
  haptic: true, // haptic feedback
  tabBorderRadius: 15,
  tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
  tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
  tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
  curve: Curves.easeOutExpo, // tab animation curves
  duration: Duration(milliseconds: 900), // tab animation duration
  gap: 8, // the tab button gap between icon and text
  color: Colors.grey[800], // unselected icon color
  activeColor: Colors.purple, // selected icon and text color
  iconSize: 24, // tab button icon size
  tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
  tabs: [
    GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    GButton(
      icon: LineIcons.heart_o,
      text: 'Likes',
    ),
    GButton(
      icon: LineIcons.search,
      text: 'Search',
    ),
    GButton(
      icon: LineIcons.user,
      text: 'Profile',
    )
  ]
)
 */

/*
GNav(
          //rippleColor: Colors.white, // tab button ripple color when pressed
          //hoverColor: Colors.white, // tab button hover color
          //tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
          //tabBorder: Border.all(color: Colors.red, width: 1), // tab button border
          //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          //curve: Curves.easeOutExpo, // tab animation curves
          //duration: Duration(milliseconds: 900), // tab animation duration
          tabBackgroundColor: Colors.white, // selected tab background color
          haptic: true, // haptic feedback
          tabBorderRadius: 0,
          gap: 8, // the tab button gap between icon and text
          color: Colors.white, // unselected icon color
          activeColor: Colors.blueGrey[700], // selected icon and text color
          iconSize:100 , // tab button icon size
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              //icon: Icons.image//('assets/BP_01.png') as IconData,
              icon: Icons.home,//('assets/BP_01.png') as IconData
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Food()),
                );
              }
            ),
            GButton(
              icon: Icons.heart_broken,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Food()),
                  );
                }
            ),
            GButton(
                icon: Icons.food_bank_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Food()),
                  );
                }
            ),
            GButton(
                icon: Icons.fitness_center,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise()),
                  );
                }
            )
          ]
      ),
 */