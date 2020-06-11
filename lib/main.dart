import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/views/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xfff5f5ff),
        accentColor: kAccentColor,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.white),
          overline: TextStyle(color: kPrimaryColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInScreen(),
    );
  }
}
