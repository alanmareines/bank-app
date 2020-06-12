import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/components/primary_button.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class PaymentFinalScreen extends StatefulWidget {
  PaymentFinalScreen({@required this.customer, @required this.transaction});
  final CustomerModel customer;
  final TransactionModel transaction;

  @override
  _PaymentFinalScreenState createState() => _PaymentFinalScreenState();
}

class _PaymentFinalScreenState extends State<PaymentFinalScreen> {
  final _amountKey = GlobalKey<FormState>();
  final amountController = TextEditingController();

  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: kCustomAppBar('Confirme os dados')),
        body: widget.transaction.amount == null
            ? enterAmount()
            : buildPaymentConfirmation());
  }

  Center enterAmount() {
    return Center(
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
          child: Form(
            key: _amountKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Valor não informado pelo recebedor, insira o valor",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                ),
                Text("R\$", style: TextStyle(color: Colors.grey, fontSize: 14)),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: amountController,
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
                      if (_amountKey.currentState.validate()) {
                        //TODO
                      }
                    },
                    buttonTitle: 'Gerar QR Code')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildPaymentConfirmation() {
    return Center(
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
                  "Confira as Informações Antes do Aceite!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InfoField(
                      prefix: 'Valor: ',
                      suffix: 'R\$ ${widget.transaction.amount}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InfoField(
                      prefix: 'Para: ',
                      suffix:
                          '${widget.transaction.merchantName.toUpperCase()}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InfoField(
                      prefix: 'Conta DICT: ',
                      suffix: widget.transaction.creditorAccountId,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InfoField(
                      prefix: 'Data/Hora: ',
                      suffix:
                          '${widget.transaction.dateTime.day}/${widget.transaction.dateTime.month}/${widget.transaction.dateTime.year} - ${widget.transaction.dateTime.hour}:${widget.transaction.dateTime.minute}',
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                  onTap: () {
                    widget.transaction
                        .makePayment(widget.customer, widget.transaction);
                  },
                  buttonTitle: "OK")
            ],
          ),
        ),
      ),
    );
  }
}

class InfoField extends StatelessWidget {
  const InfoField({
    this.suffix,
    this.prefix,
    Key key,
  }) : super(key: key);

  final String suffix;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: prefix, style: TextStyle(color: Colors.grey, fontSize: 14)),
          TextSpan(
            text: suffix,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
