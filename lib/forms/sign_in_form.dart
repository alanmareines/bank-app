import 'package:banking_app/views/screen_index.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/components/primary_button.dart';
import 'package:banking_app/constants.dart';

// Define a custom Form widget.
class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _signInKey = GlobalKey<FormState>();
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signInKey,
        child: Column(children: <Widget>[
          TextFormField(
            style: TextStyle(color: kPrimaryColor),
            decoration: const InputDecoration(
              icon: Icon(Icons.account_circle,
                  size: 35.0, color: Color(0xFF0f2263)),
              hintText: 'Sua conta',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo deve ser Preenchido';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.00,
          ),
          TextFormField(
            style: TextStyle(color: kPrimaryColor),
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.enhanced_encryption,
                  size: 35.0, color: Color(0xFF0f2263)),
              hintText: 'Sua Senha',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo deve ser Preenchido';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PrimaryButton(
              onTap: () {
                // CustomerInfo linaInfo = CustomerInfo(accountId: accountId, password: password)
                if (_signInKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenIndex(),
                    ),
                  );
                }
              },
              buttonTitle: 'ACESSAR CONTA',
            ),
          ),
        ]));
  }
}
