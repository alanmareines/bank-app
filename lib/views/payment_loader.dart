import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/primary_button.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:banking_app/views/payment_final_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentLoader extends StatefulWidget {
  final String qrData;
  final CustomerModel customer;
  final bool payer;

  PaymentLoader(
      {@required this.qrData, @required this.customer, @required this.payer});

  @override
  _PaymentLoaderState createState() => _PaymentLoaderState();
}

class _PaymentLoaderState extends State<PaymentLoader> {
  final _paymentPayerKey = GlobalKey<FormState>();
  final payerAmountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    buildLoader();
    if (widget.payer) {
      makePayment();
    } else {
      generateQr();
    }
  }

  void dispose() {
    payerAmountController.dispose();
    super.dispose();
  }

  Future makePayment() async {
    var transaction = await TransactionModel()
        .buildTransaction(widget.customer, widget.qrData);
    if (transaction.amount == null || transaction.amount == "") {
      insertAmount(transaction);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PaymentFinalScreen(
            customer: widget.customer, transaction: transaction);
      }));
    }
  }

  insertAmount(transaction) {
    Form(
      key: _paymentPayerKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "Insira o valor a ser pago",
              textAlign: TextAlign.center,
              style: TextStyle(color: kPrimaryColor, fontSize: 16),
            ),
          ),
          Text("R\$", style: TextStyle(color: Colors.grey, fontSize: 14)),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: payerAmountController,
            style: TextStyle(color: kPrimaryColor, fontSize: 40),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo deve ser Preenchido';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          PrimaryButton(
              onTap: () {
                if (_paymentPayerKey.currentState.validate()) {
                  transaction.amount = payerAmountController.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentFinalScreen(
                        customer: widget.customer, transaction: transaction);
                  }));
                }
              },
              buttonTitle: 'Confirmar Pagamento')
        ],
      ),
    );
  }

  Future generateQr() async {
    var qrString =
        await TransactionModel().generateQr(widget.customer, widget.qrData);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: kCustomAppBar('Seu QR está Pronto!')),
        body: Center(
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
                  buildQr(qrString),
                  PrimaryButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonTitle: 'Voltar')
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  QrImage buildQr(string) {
    return QrImage(
        data: string,
        version: QrVersions.auto,
        size: MediaQuery.of(context).size.width * 0.8);
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
