import 'package:banking_app/components/custom_icons.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => _currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: kAccentColor,
        elevation: 20.0,
        items: [
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(CustomIcons.qrcode),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
