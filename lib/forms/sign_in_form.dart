import 'package:banking_app/views/screen_index.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/components/primary_button.dart';

// Define a custom Form widget.
class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signInKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
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
            decoration: const InputDecoration(
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
