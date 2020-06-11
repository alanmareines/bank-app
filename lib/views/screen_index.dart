import 'package:banking_app/components/custom_icons.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/transaction_screen.dart';
import 'package:banking_app/views/pix_pay.dart';
import 'package:banking_app/views/info.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';
import 'home.dart';

class ScreenIndex extends StatefulWidget {
  ScreenIndex({this.customer});
  final CustomerModel customer;

  @override
  _ScreenIndexState createState() => _ScreenIndexState();
}

class _ScreenIndexState extends State<ScreenIndex> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _screens = [
      HomeScreen(customer: widget.customer),
      TransactionScreen(customer: widget.customer),
      PixPayScreen(),
      InfoScreen(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: kAccentColor,
        elevation: 0.0,
        items: [Icons.home, Icons.repeat, CustomIcons.qrcode, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
