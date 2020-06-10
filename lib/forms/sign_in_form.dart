import 'package:banking_app/components/secondary_button.dart';
import 'package:banking_app/views/loading_screen.dart';
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
  final accountIdController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    accountIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signInKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: accountIdController,
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
            controller: passwordController,
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
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: PrimaryButton(
              onTap: () {
                // CustomerInfo linaInfo = CustomerInfo(accountId: accountId, password: password)
                if (_signInKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(
                            accountId: accountIdController.text,
                            password: passwordController.text)),
                  );
                }
              },
              buttonTitle: 'ACESSAR CONTA',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SecondaryButton(
              onTap: () {
                // CustomerInfo linaInfo = CustomerInfo(accountId: accountId, password: password)
                if (_signInKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreen(
                            accountId: accountIdController.text,
                            password: passwordController.text)),
                  );
                }
              },
              buttonTitle: 'ABRA SUA CONTA',
            ),
          ),
        ]));
  }
}
