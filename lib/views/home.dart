import 'package:banking_app/components/credit_cards.dart';
import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/jumbotron.dart';
import 'package:banking_app/components/chart.dart';
import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:banking_app/models/customer_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({@required this.customer});

  final CustomerModel customer;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      CreditCard(
          userName: widget.customer.name,
          number: '1234 1234 1234 1234',
          brand: "VISA",
          gradient: [Color(0xffFDC830), Color(0xffF37335)]),
      CreditCard(
          userName: widget.customer.name,
          number: '1234 1234 1234 1234',
          brand: "MASTER CARD",
          gradient: [Color(0xffa8c0ff), Color(0xff3f2b96)]),
      CreditCard(
          userName: widget.customer.name,
          number: '1234 1234 1234 1234',
          brand: "VISA",
          gradient: [Color(0xffbc4e9c), Color(0xfff80759)]),
      CreditCard(
          userName: widget.customer.name,
          number: '1234 1234 1234 1234',
          brand: "AMERICAN EXPRESS",
          gradient: [Color(0xff96c93d), Color(0xff00b09b)]),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            title: kCustomAppBar('Olá, ${widget.customer.name}'),
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 120,
                          viewportFraction: 0.50,
                          autoPlay: false,
                          enlargeCenterPage: true,
                        ),
                        items: cardList,
                      ),
                      AccountChart(),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 8,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Pagamentos Instantâneos disponível',
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(height: 20.0),
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
                              Flexible(flex: 3, child: kPixLogo),
                            ],
                          ),
                        ),
                      )
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
}
