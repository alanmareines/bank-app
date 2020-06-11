import 'package:banking_app/components/custom_app_bar.dart';
import 'package:banking_app/constants.dart';
import 'package:banking_app/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(width: 320, height: 320),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                margin: EdgeInsets.all(15.0),
                height: 250,
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
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/qr_receive.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                constraints: BoxConstraints.expand(width: 320, height: 320),
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
                margin: EdgeInsets.all(15.0),
                height: 250,
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
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/qr_pay.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// main() async {
//   var result = await BarcodeScanner.scan();

//   print(result.type); // The result type (barcode, cancelled, failed)
//   print(result.rawContent); // The barcode content
//   print(result.format); // The barcode format (as enum)
//   print(result
//       .formatNote); // If a unknown format was scanned this field contains a note
// }

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
