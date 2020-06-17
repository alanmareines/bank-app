import 'package:flutter/material.dart';
import 'package:banking_app/constants.dart';
import 'background_shapes.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({
    Key key,
    @required this.accountId,
    @required this.accountBalance,
  }) : super(key: key);

  final String accountId;
  final String accountBalance;
  final double appBarHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          CustomPaint(
            size: Size.fromHeight(200.00),
            painter: ShapePainter(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: statusBarHeight + 66),
                    Text('Conta'),
                    Text(accountId, style: TextStyle(color: kAccentColor)),
                    SizedBox(height: 14.0),
                    Text('Saldo', style: TextStyle(color: Colors.white)),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'R\$ '),
                          TextSpan(
                            text: double.parse(accountBalance)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
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
