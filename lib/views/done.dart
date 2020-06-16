import 'package:banking_app/components/primary_button.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/pix_pay.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Done extends StatefulWidget {
  Done({this.customer});

  final CustomerModel customer;

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: 1,
        duration: Duration(milliseconds: 500),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
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
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.fromLTRB(20.00, 20.00, 20.00, 20.00),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Text(
                      "TRANSAÇÃO REALIZADA!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kPositiveColor, fontSize: 22),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.done_outline,
                        color: kPositiveColor, size: 40),
                  ),
                  PrimaryButton(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PixPayScreen(
                              customer: widget.customer,
                            ),
                          ),
                        );
                      },
                      buttonTitle: 'Voltar'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
