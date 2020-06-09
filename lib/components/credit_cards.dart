import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  CreditCard(
      {@required this.gradient,
      @required this.brand,
      @required this.number,
      this.userName});

  final List<Color> gradient;
  final String brand;
  final String number;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 110,
      child: Card(
        semanticContainer: true,
        elevation: 7,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              gradient: LinearGradient(colors: gradient)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(brand,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
              Text(number, style: TextStyle(color: Colors.white)),
              Text(userName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w100)),
            ],
          ),
        ),
      ),
    );
  }
}
