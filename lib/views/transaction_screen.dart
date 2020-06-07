import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/transaction.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen(
      {@required this.userName,
      @required this.accountBalance,
      @required this.accountId});

  final String accountBalance;
  final String accountId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá, $userName')),
      body: Column(
        children: <Widget>[
          Jombotron(accountId: accountId, accountBalance: accountBalance),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15.0)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 15.0, right: 15.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'TRANSAÇÕES',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Icon(Icons.account_balance_wallet,
                            color: Colors.grey[800]),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  Transaction(
                      counterParty: "Wellington Barbosa",
                      amount: "100,00",
                      date: "29/01/2020"),
                  Transaction(
                      counterParty: "Márcio Castro",
                      amount: "-120,00",
                      date: "29/01/2020"),
                  Transaction(
                      counterParty: "Murilo Rabusky",
                      amount: "2.309,00",
                      date: "29/01/2020"),
                  Transaction(
                      counterParty: "Wellington Barbosa",
                      amount: "-132,23",
                      date: "29/01/2020"),
                  Transaction(
                      counterParty: "Márcio Castro",
                      amount: "29,00",
                      date: "29/01/2020"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
