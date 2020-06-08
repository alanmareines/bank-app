import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({
    @required this.title,
    @required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.00,
      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 10.0, bottom: 10.00),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.00))),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40.0, color: kPrimaryColor),
          Spacer(),
          Text(title,
              style: TextStyle(color: Colors.grey[800], fontSize: 11.0)),
        ],
      ),
    );
  }
}
