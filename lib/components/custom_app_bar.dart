import 'package:flutter/material.dart';

Widget kCustomAppBar(title) {
  return Container(
    child: Text(title, style: (TextStyle(fontSize: 16.00))),
    decoration: BoxDecoration(
        color: Colors.transparent,
        gradient:
            LinearGradient(colors: [Color(0xff3e35ad), Color(0xff051f55)])),
  );
}
