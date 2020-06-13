import 'package:flutter/material.dart';
import 'package:banking_app/forms/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background_sign_in.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
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
      ),
    );
  }
}
