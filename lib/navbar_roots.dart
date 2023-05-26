import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';
import 'package:flutter_application/profile_screen.dart';
import 'package:flutter_application/tips.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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

    //settings screen
    TipScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabBorderRadius: 100,
            activeColor: Colors.black,
            gap: 8,
            tabBorder: Border.all(
                color: Colors.white30, width: 2, style: BorderStyle.solid),
            backgroundColor: Colors.black87,
            padding: EdgeInsets.all(16),
            tabBackgroundColor: Colors.grey,
            color: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.tv,
                text: 'Health Tips',
              ),
              GButton(
                icon: Icons.person,
                text: 'profile',
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.red,
      //   color: Colors.red.shade300,
      //   animationDuration: Duration(milliseconds: 400),
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //     ),
      //     Icon(
      //       CupertinoIcons.chat_bubble_fill,
      //       size: 30,
      //     ),
      //     Icon(
      //       Icons.calendar_month,
      //       size: 30,
      //     ),
      //     Icon(
      //       Icons.settings,
      //       size: 30,
      //     ),
      //   ],
      // ),
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
