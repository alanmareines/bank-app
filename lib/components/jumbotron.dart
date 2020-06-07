import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';

class Jombotron extends StatelessWidget {
  const Jombotron({
    Key key,
    @required this.accountId,
    @required this.accountBalance,
  }) : super(key: key);

  final String accountId;
  final String accountBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColor, Color(0xFF2b2f8d)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.00)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Conta'),
          Text('$accountId', style: TextStyle(color: kAccentColor)),
          SizedBox(height: 20.0),
          Text('Saldo', style: TextStyle(color: Colors.white)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'R\$ '),
                TextSpan(
                  text: accountBalance,
                  style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
