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
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
      ),
    );
  }
}
