import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:banking_app/views/payment_final_screen.dart';

class PaymentLoader extends StatefulWidget {
  final String qrData;
  final CustomerModel customer;

  PaymentLoader({@required this.qrData, @required this.customer});

  @override
  _PaymentLoaderState createState() => _PaymentLoaderState();
}

class _PaymentLoaderState extends State<PaymentLoader> {
  @override
  void initState() {
    super.initState();
    buildLoader();
    makePayment();
  }

  Future makePayment() async {
    var transaction = await TransactionModel()
        .buildTransaction(widget.customer, widget.qrData);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return PaymentFinalScreen(
        customer: widget.customer,
        transaction: transaction,
      );
    }));
    //TODO CONFIRMATION
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoader(),
    );
  }

  Center buildLoader() {
    return Center(
      child: SpinKitChasingDots(
        color: kPrimaryColor,
        size: 100.0,
      ),
    );
  }
}
