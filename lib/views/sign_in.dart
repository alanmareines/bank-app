import 'package:flutter/material.dart';
import 'package:banking_app/forms/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebf5ff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset('assets/images/background_sign_in_2.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 14,
                      offset: Offset(0, -3),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.00)),
                ),
                padding: EdgeInsets.fromLTRB(20.00, 20.00, 20.00, 20.00),
                child: SignInForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
