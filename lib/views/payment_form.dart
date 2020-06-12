import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/primary_button.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/payment_loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import '../constants.dart';

class PaymentForm extends StatefulWidget {
  PaymentForm({this.customer, this.payer});
  final CustomerModel customer;
  final bool payer;

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _paymentKey = GlobalKey<FormState>();
  final payeeAmountController = TextEditingController();

  void dispose() {
    payeeAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: kCustomAppBar(
              widget.payer ? 'Pagamento via PIX' : 'Cobrar via PIX')),
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
            child: widget.payer ? buildPayerScreen() : buildFormPayee(),
          ),
        ),
      ),
    );
  }

  buildPayerScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            "Pressione o botão e aponte o celular em direção ao Código QR",
            textAlign: TextAlign.center,
            style: TextStyle(color: kPrimaryColor, fontSize: 18),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/images/qr_reader.gif'),
            ),
          ),
        ),
        PrimaryButton(
            onTap: () {
              readQRPayer(widget.customer);
            },
            buttonTitle: "OK")
      ],
    );
  }

  readQRPayer(customer) async {
    var options = ScanOptions(autoEnableFlash: true);

    // var result = await BarcodeScanner.scan(options: options);
    var result =
        "00020126580014br.gov.bcb.pix0136123e4567-e12b-12d1-a456-4266554400005204000053039865802BR5913Fulano de Tal6008BRASILIA62070503***63041D3D";
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PaymentLoader(customer: customer, qrData: result);
        },
      ),
    );

    // REAL CODE
    // if (result.rawContent == "") {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return PaymentLoader(customer: customer, qrData: result.rawContent);
    //       },
    //     ),
    //   );
    // } else {
    //   print(result.type);
    // }

    //EXCEPTIONS
    // print(result.format); // The barcode format (as enum)
    // print(result
    //     .formatNote); // If a unknown format was scanned this field contains a note
  }

  Form buildFormPayee() {
    return Form(
      key: _paymentKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "Insira o valor e receba na hora!",
              textAlign: TextAlign.center,
              style: TextStyle(color: kPrimaryColor, fontSize: 16),
            ),
          ),
          Text("R\$", style: TextStyle(color: Colors.grey, fontSize: 14)),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: payeeAmountController,
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
                if (_paymentKey.currentState.validate()) {
                  //TODO
                }
              },
              buttonTitle: 'Gerar QR Code')
        ],
      ),
    );
  }
}
