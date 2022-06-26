import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CreateScanner extends StatefulWidget {
  const CreateScanner({Key? key}) : super(key: key);

  @override
  State<CreateScanner> createState() => _CreateScannerState();
}

class _CreateScannerState extends State<CreateScanner> {
  var Create = 'Add Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Create'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(

            data: Create,
            barcode: Barcode.qrCode(),
            color: Colors.black,
            width: 200,
            height: 200,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .8,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  Create = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Enter Here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                SaveImage();
              },
              child: Text('Save Png')),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }

  void SaveImage() async {
    await GallerySaver.saveImage(Create, toDcim: true);
  }
}
