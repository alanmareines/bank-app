import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';
import 'background_shapes.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({
    Key key,
    @required this.accountId,
    @required this.accountBalance,
    @required this.title,
  }) : super(key: key);

  final String accountId;
  final String title;
  final String accountBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: ShapePainter(),
            child: Container(
              constraints: BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Conta'),
                    Text(accountId, style: TextStyle(color: kAccentColor)),
                    SizedBox(height: 14.0),
                    Text('Saldo', style: TextStyle(color: Colors.white)),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'R\$ '),
                          TextSpan(
                            text: accountBalance,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
