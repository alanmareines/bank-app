import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/transaction.dart';
import 'package:banking_app/components/service.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';

import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({@required this.customer});
  final CustomerModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            title: kCustomAppBar('Sua Carteira'),
            pinned: true,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Jumbotron(
                accountBalance: customer.balance,
                accountId: customer.accountId,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
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
                Container(
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
                      Column(
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
                          Transaction(
                              counterParty: "Liliane Dutra",
                              amount: "100,00 R\$",
                              date: "14/03/2020"),
                          Transaction(
                              counterParty: "Marcos Guirro",
                              amount: "-120,00 R\$",
                              date: "17/02/2020"),
                          Transaction(
                              counterParty: "Edsandro Rodrigues",
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //getting transactions from LINA API

  Future getTransactions() async {
    var transactionList =
        await TransactionModel().getCustomerTransactions(customer.token);
    print(transactionList);
    return transactionList;
  }

  //Building a LIST VIEW for transactions fetched in API

  Widget transactionsWidget() {
    return FutureBuilder(
      builder: (context, transactionSnap) {
        //IF Request went bad, return Container.
        if (transactionSnap.connectionState == ConnectionState.none &&
            transactionSnap.hasData == null) {
          return Container(child: Text("transactionSnap is $transactionSnap"));
        }
        //If 200, then build LIST
        return ListView.builder(
          itemCount: transactionSnap.data.length,
          itemBuilder: (context, index) {
            Transaction transaction = transactionSnap.data[index];
            print(transaction);
            return Column(
              children: <Widget>[
                // Widget to display the list of project
              ],
            );
          },
        );
      },
      future: getTransactions(),
    );
  }
}
