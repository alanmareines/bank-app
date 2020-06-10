import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: kPrimaryColor, width: 1.0, style: BorderStyle.solid),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: kPrimaryColor,
              letterSpacing: 3.0,
            ),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
      ),
    );
  }
}
