import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/transaction.dart';
import 'package:banking_app/components/service.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 25.0, left: 15.0, right: 15.0, bottom: 0.0),
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
                      transactionsWidget(customer.accountId),
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
    return transactionList;
  }

  //Building a LIST VIEW for transactions fetched in API

  Widget transactionsWidget(String customer_account_id) {
    return FutureBuilder(
      builder: (context, transactionSnap) {
        if (transactionSnap.connectionState == ConnectionState.done) {
          //IF Request went bad, return Container.
          if (transactionSnap.connectionState == ConnectionState.none ||
              transactionSnap.hasData == null) {
            return Container(
                child: Text("transactionSnap is $transactionSnap"));
          }
          initializeDateFormatting('pt_BR', null);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: transactionSnap.data.length,
            itemBuilder: (context, index) {
              var transaction = transactionSnap.data[index];
              var debtor_account_id = transaction["debtor_account_id"];
              var creditor_account_id = transaction["creditor_account_id"];
              var counterParty;
              var amount = transaction["amount"];

              if (customer_account_id == debtor_account_id) {
                counterParty = creditor_account_id;
                amount = "- $amount R\$";
              } else {
                counterParty = debtor_account_id;
                amount = "$amount R\$";
              }

              String formattedDate = DateFormat('dd-MM-yyy – kk:mm:ss')
                  .format(DateTime.parse(transaction["inserted_at"]).toLocal());
              return Column(
                children: <Widget>[
                  Transaction(
                      counterParty: counterParty,
                      amount: amount,
                      date: formattedDate),
                ],
              );
            },
          );
        } else {
          return Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: CircularProgressIndicator());
        }
      },
      future: getTransactions(),
    );
  }
}
