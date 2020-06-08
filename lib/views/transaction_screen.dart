import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/transaction.dart';
import 'package:banking_app/components/service.dart';
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
      body: Column(
        children: <Widget>[
          Jumbotron(
              accountId: accountId,
              accountBalance: accountBalance,
              title: 'Sua Carteira'),
          Container(
            padding: EdgeInsets.only(left: 5.00),
            height: 105.00,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Service(title: 'Depositar', icon: Icons.play_for_work),
                Service(title: 'Pagar', icon: Icons.attach_money),
                Service(title: 'Investimento', icon: Icons.insert_chart),
                Service(title: 'Extrato', icon: Icons.receipt),
                Service(title: 'Contatos', icon: Icons.account_box),
                Service(title: 'Informações', icon: Icons.info),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15.0)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
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
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Transaction(
                            counterParty: "Wellington Barbosa",
                            amount: "100,00 R\$",
                            date: "14/03/2020"),
                        Transaction(
                            counterParty: "Márcio Castro",
                            amount: "-120,00 R\$",
                            date: "17/02/2020"),
                        Transaction(
                            counterParty: "Murilo Rabusky",
                            amount: "2.309,00 R\$",
                            date: "29/01/2020"),
                        Transaction(
                            counterParty: "Wellington Barbosa",
                            amount: "-132,23 R\$",
                            date: "26/01/2020"),
                        Transaction(
                            counterParty: "Márcio Castro",
                            amount: "29,00 R\$",
                            date: "20/01/2020"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
