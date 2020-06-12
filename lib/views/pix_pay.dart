import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:banking_app/views/payment_form.dart';
import 'package:flutter/material.dart';

class PixPayScreen extends StatefulWidget {
  PixPayScreen({this.customer});
  final CustomerModel customer;

  @override
  _PixPayScreenState createState() => _PixPayScreenState();
}

class _PixPayScreenState extends State<PixPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            title: kCustomAppBar('Pagamentos Instantâneos PIX'),
            pinned: true,
          ),
          buildPixMenu(),
        ],
      ),
    );
  }

  SliverList buildPixMenu() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentForm(customer: widget.customer, payer: false);
                  }));
                },
                child: Container(
                  constraints: BoxConstraints.expand(
                      width: 320,
                      height: MediaQuery.of(context).size.height / 2.8),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(10.0, 10.0),
                          blurRadius: 20.0,
                        )
                      ]),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Receber com PIX',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "©",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                      Text("Gere seu QR para recebimento em sua carteira",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/qr_receive.gif'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentForm(customer: widget.customer, payer: true);
                  }));
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  constraints: BoxConstraints.expand(
                      width: 320,
                      height: MediaQuery.of(context).size.height / 2.8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(10.0, 10.0),
                          blurRadius: 20.0,
                        )
                      ]),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Pagar com PIX',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "©",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                      Text("Escaneie QR's para Pagamentos Instantâneos",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black)),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/qr_pay.gif'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: QrImage(
//             data: "1234567890",
//             version: QrVersions.auto,
//             size: MediaQuery.of(context).size.width,
//           ),
//         ),
//         Container(
//           child: Center(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(50))),
//               child: IconButton(
//                   padding: EdgeInsets.all(20.00),
//                   iconSize: 60,
//                   color: kPrimaryColor,
//                   icon: Icon(Icons.camera_alt),
//                   onPressed: () {
//                     main();
//                   }),
//             ),
//           ),
//         ),
//       ],
//     );
