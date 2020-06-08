import 'package:banking_app/components/credit_cards.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/chart.dart';
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
      body: Stack(
        children: <Widget>[
          Jumbotron(
              accountId: accountId,
              accountBalance: accountBalance,
              title: 'Olá, $userName'),
          Container(
            margin: EdgeInsets.only(
              top: 200.0,
            ),
            padding: EdgeInsets.zero,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                    AccountChart(),
                    Container(
                      height: 200,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Pagamentos Instantâneos disponível',
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 22.0),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Experimente ',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 18.0),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.grey[600],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: kPixLogo),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
