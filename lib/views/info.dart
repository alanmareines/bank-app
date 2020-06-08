import 'package:banking_app/components/jumbotron.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Jumbotron(
            accountId: 'alanmareines@gmail.com',
            accountBalance: '20.000,00',
            title: 'Informações'));
  }
}
