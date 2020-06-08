import 'package:banking_app/components/credit_cards.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Widget> cardList = [
  CreditCard(
      color: Colors.blue,
      userName: 'Alan Mareines',
      number: '1234 1234 1234 1234',
      brand: "VISA"),
  CreditCard(
      color: Colors.orange,
      userName: 'Alan Mareines',
      number: '1234 1234 1234 1234',
      brand: "MASTER CARD"),
  CreditCard(
      color: Colors.red,
      userName: 'Alan Mareines',
      number: '1234 1234 1234 1234',
      brand: "VISA"),
  CreditCard(
      color: Colors.purple,
      userName: 'Alan Mareines',
      number: '1234 1234 1234 1234',
      brand: "AMERICAN EXPRESS"),
];

final List<Widget> imageSliders = cardList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[item],
              )),
        ),
      ),
    )
    .toList();

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {@required this.userName,
      @required this.accountId,
      @required this.accountBalance});

  final String userName;
  final String accountBalance;
  final String accountId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá, $userName')),
      body: Column(
        children: <Widget>[
          Jumbotron(accountId: accountId, accountBalance: accountBalance),
          SizedBox(height: 5.0),
          Container(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: 120,
                    viewportFraction: 0.50,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
              height: 200,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    kPixLogo,
                    Text(
                      'A nova forma de pagar e economizar',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ],
                ),
              )),
          Container(height: 200, color: Colors.purple),
        ],
      ),
    );
  }
}
