import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    Key key,
    @required this.counterParty,
    @required this.amount,
    @required this.date,
  }) : super(key: key);

  final String counterParty;
  final String amount;
  final String date;

  amountColor(amount) {
    if (amount.contains('-')) {
      return Text(amount, style: TextStyle(color: kNegativeColor));
    } else {
      return Text(amount, style: TextStyle(color: kPositiveColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(counterParty, style: TextStyle(color: Colors.grey[800])),
              Text(date,
                  style: TextStyle(color: kPrimaryColor, fontSize: 11.0)),
            ],
          ),
          amountColor(amount),
        ],
      ),
    );
  }
}
