import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';
import 'package:flutter_application/setting.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //homescreen
    HomeScreen(),
    //message screen
    Container(),
    //schedule screen
    Container(),
    //settings screen
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: Colors.red,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.red,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            CupertinoIcons.chat_bubble_fill,
            size: 30,
          ),
          Icon(
            Icons.calendar_month,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 80,
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.white,
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.red,
      //     unselectedItemColor: Colors.deepPurpleAccent,
      //     selectedLabelStyle:
      //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //     unselectedLabelStyle:
      //         TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      //     currentIndex: _selectedIndex,
      //     onTap: (index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home_filled),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.chat_bubble_2_fill),
      //         label: "Messages",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.calendar_month),
      //         label: "Schedule",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.settings),
      //         label: "settings",
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
