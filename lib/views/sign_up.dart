import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  final String name;
  final String privateId;
  final String email;
  final String accountId;
  final String address;
  final String cep;
  final String phone;
  final String password;
  final String passwordConfirmation;

  SignUpScreen(
      {@required this.name,
      @required this.privateId,
      @required this.email,
      @required this.accountId,
      @required this.address,
      @required this.cep,
      @required this.phone,
      @required this.password,
      @required this.passwordConfirmation});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    signUpUser();
  }

  Future signUpUser() async {
    await CustomerModel().signUpCustomer(
        widget.name,
        widget.privateId,
        widget.email,
        widget.accountId,
        widget.address,
        widget.cep,
        widget.phone,
        widget.password,
        widget.passwordConfirmation);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoadingScreen(
        accountId: widget.accountId,
        password: widget.password,
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
