import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  CreditCard(
      {@required this.color,
      @required this.brand,
      @required this.number,
      this.userName});

  final Color color;
  final String brand;
  final String number;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: color),
        width: 220,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(brand,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              Text(number, style: TextStyle(color: Colors.white)),
              Text(userName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w100)),
            ],
          ),
        ));
  }
}
