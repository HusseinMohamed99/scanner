import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanner/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
           SizedBox(
             height: 20,
           ),

            InkWell(
                onTap: () {
                  Openurl();
                },
                child: Text(
                  QR,
                  style: TextStyle(color: Colors.blue,fontSize: 20),
                )),
            Spacer(
              flex: 1,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xFF008080)),
                ),
                onPressed: () {
                  QRCode();
                },
                child: Text('Scanner'),
              ),
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  Openurl() {
    String url = QR;
    launch(url);
  }

  Future<void> QRCode() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      ).then((value) {
        setState(() {
          QR = value;
        });
      });

      /// barcode to be used

    } catch (e) {
      setState(() {
        QR = 'Unable';
      });
    }
  }
}
