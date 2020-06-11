import 'package:banking_app/components/custom_icons.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/home.dart';
import 'package:banking_app/views/info.dart';
import 'package:banking_app/views/pix_pay.dart';
import 'package:banking_app/views/transaction_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({@required this.customer, @required this.index});

  final int index;
  final CustomerModel customer;

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
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  if (_currentIndex != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(customer: widget.customer)));
                  }
                },
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 1 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: IconButton(
                icon: Icon(CustomIcons.qrcode),
                onPressed: () {
                  if (_currentIndex != 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TransactionScreen(customer: widget.customer)));
                  }
                },
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 2 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  if (_currentIndex != 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PixPayScreen()));
                  }
                },
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(""),
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color:
                      _currentIndex == 3 ? kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0)),
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  if (_currentIndex != 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoScreen()));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
