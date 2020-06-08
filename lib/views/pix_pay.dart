import 'package:banking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class PixPayScreen extends StatelessWidget {
  main() async {
    var result = await BarcodeScanner.scan();

    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result
        .formatNote); // If a unknown format was scanned this field contains a note
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: IconButton(
              padding: EdgeInsets.all(20.00),
              iconSize: 60,
              color: kPrimaryColor,
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                main();
              }),
        ),
      ),
    );
  }
}
