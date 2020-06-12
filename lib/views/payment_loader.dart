import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentLoader extends StatefulWidget {
  final String qrData;

  PaymentLoader({@required this.qrData});

  @override
  _PaymentLoaderState createState() => _PaymentLoaderState();
}

class _PaymentLoaderState extends State<PaymentLoader> {
  @override
  void initState() {
    super.initState();
    makePayment();
  }

  Future makePayment() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: kPrimaryColor,
          size: 100.0,
        ),
      ),
    );
  }
}
