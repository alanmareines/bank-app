import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String accountId;
  final String password;

  LoadingScreen({@required this.accountId, @required this.password});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    var customerToken = await CustomerModel()
        .getCustomerToken(widget.accountId, widget.password);
    var customerData =
        await CustomerModel().getCustomerInfo(customerToken, widget.accountId);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        accountBalance: customerData.balance,
        accountId: customerData.accountId,
        userName: customerData.name,
      );
    }));
  }

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
