import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 3.0,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
      ),
    );
  }
}
