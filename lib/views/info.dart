import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({this.userName, this.accountId, this.accountBalance});

  final String userName;
  final String accountId;
  final String accountBalance;

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
          title: kCustomAppBar('oi'),
          pinned: true,
          expandedHeight: 210.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Jumbotron(
              accountBalance: '200.00',
              accountId: 'alanmareines@gmail.com',
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[],
          ),
        ),
      ],
    ));
  }
}
