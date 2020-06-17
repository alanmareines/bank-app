import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({this.customer});

  final CustomerModel customer;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kPrimaryColor,
          title: kCustomAppBar('Informações'),
          pinned: true,
          expandedHeight: 210.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Jumbotron(
              accountBalance: widget.customer.balance,
              accountId: widget.customer.accountId,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 150.0),
                child: Center(
                    child: Text('LINAPAY.IO',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor))),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
