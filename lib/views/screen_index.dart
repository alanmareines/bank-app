import 'package:banking_app/views/transaction_screen.dart';
import 'package:banking_app/views/pix_pay.dart';
import 'package:banking_app/views/info.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';
import 'home.dart';

class ScreenIndex extends StatefulWidget {
  @override
  _ScreenIndexState createState() => _ScreenIndexState();
}

class _ScreenIndexState extends State<ScreenIndex> {
  final List _screens = [
    HomeScreen(
      userName: 'Alan Mareines',
      accountBalance: '20.000,00',
      accountId: 'alanmareines@gmail.com',
    ),
    TransactionScreen(
      userName: 'Alan Mareines',
      accountBalance: '20.000,00',
      accountId: 'alanmareines@gmail.com',
    ),
    PixPayScreen(),
    InfoScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    color:
                        _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Icon(Icons.home),
              ),
            )
          ]

          // [Icons.home, Icons.repeat, Icons.camera_alt, Icons.info]
          //     .asMap()
          //     .map((key, value) => MapEntry(
          //           key,
          //           BottomNavigationBarItem(
          //             title: Text(''),
          //             icon: Container(
          //               padding: const EdgeInsets.symmetric(
          //                 vertical: 6.0,
          //                 horizontal: 16.0,
          //               ),
          //               decoration: BoxDecoration(
          //                 color: _currentIndex == key
          //                     ? kPrimaryColor
          //                     : Colors.transparent,
          //                 borderRadius: BorderRadius.circular(20.0),
          //               ),
          //               child: Icon(value),
          //             ),
          //           ),
          //         ))
          //     .values
          //     .toList(),
          ),
    );
  }
}
