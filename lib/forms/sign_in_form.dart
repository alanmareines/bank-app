import 'package:banking_app/components/secondary_button.dart';
import 'package:banking_app/views/loading_screen.dart';
import 'package:banking_app/views/sign_up.dart';
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

  final _signUpKey = GlobalKey<FormState>();
  final signUpPrivateId = TextEditingController();
  final signUpAccountId = TextEditingController();
  final signUpName = TextEditingController();
  final signUpEmail = TextEditingController();
  final signUpAddress = TextEditingController();
  final signUpCEP = TextEditingController();
  final signUpPhone = TextEditingController();
  final signUpPassword = TextEditingController();
  final signUpPasswordConfirmation = TextEditingController();

  @override
  void dispose() {
    accountIdController.dispose();
    passwordController.dispose();
    signUpPasswordConfirmation.dispose();
    signUpPassword.dispose();
    signUpPhone.dispose();
    signUpCEP.dispose();
    signUpAddress.dispose();
    signUpEmail.dispose();
    signUpName.dispose();
    signUpAccountId.dispose();
    signUpPrivateId.dispose();
    super.dispose();
  }

  bool _signIn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getForm(),
    );
  }

  Form getForm() {
    if (_signIn) {
      Form formSignin = buildFormSignIn(context);
      return formSignin;
    } else {
      Form formSignUp = buildFormSignUp(context);
      return formSignUp;
    }
  }

  Form buildFormSignIn(BuildContext context) {
    return Form(
      key: _signInKey,
      child: Column(
        children: <Widget>[
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(
                        accountId: accountIdController.text,
                        password: passwordController.text,
                      ),
                    ),
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
                setState(() {
                  _signIn = false;
                });
              },
              buttonTitle: 'ABRA SUA CONTA',
            ),
          ),
        ],
      ),
    );
  }

  Form buildFormSignUp(BuildContext context) {
    return Form(
      key: _signUpKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text("Preencha os Campos",
                  style: TextStyle(color: kPrimaryColor, fontSize: 20.0)),
            ),
            TextFormField(
              controller: signUpName,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'Nome',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpPrivateId,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon:
                    Icon(Icons.pageview, size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'CPF',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpEmail,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'E-mail',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpAccountId,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.account_balance_wallet,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'Conta',
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
              controller: signUpAddress,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.location_on,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'Endereço',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpCEP,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.add_location,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'CEP',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpPhone,
              style: TextStyle(color: kPrimaryColor),
              decoration: const InputDecoration(
                icon: Icon(Icons.local_phone,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'Telefone',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Campo deve ser Preenchido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: signUpPassword,
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
            TextFormField(
              controller: signUpPasswordConfirmation,
              style: TextStyle(color: kPrimaryColor),
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.enhanced_encryption,
                    size: 35.0, color: Color(0xFF0f2263)),
                hintText: 'Sua senha novamente',
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
                  if (_signUpKey.currentState.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(
                          accountId: signUpAccountId.text,
                          name: signUpName.text,
                          privateId: signUpPrivateId.text,
                          email: signUpEmail.text,
                          address: signUpAddress.text,
                          cep: signUpCEP.text,
                          phone: signUpPhone.text,
                          password: signUpPassword.text,
                          passwordConfirmation: signUpPasswordConfirmation.text,
                        ),
                      ),
                    );
                  }
                },
                buttonTitle: 'Criar Conta',
              ),
            ),
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back, color: kPrimaryColor, size: 30),
              onPressed: () {
                setState(() {
                  _signIn = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
