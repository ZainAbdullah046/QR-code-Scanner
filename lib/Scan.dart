import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner_app/Generate.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 113, 162),
        title: const Text(
          "SCANN QR CODE",
          style: TextStyle(
              color: Color.fromARGB(179, 202, 197, 197),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Generate()));
              },
              icon: const Icon(Icons.qr_code))
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;

          for (final barcode in barcodes) {
            print("Found ${barcode.rawValue}");
          }
          if (image != null) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(barcodes.first.rawValue ?? ""),
                    content: Image(image: MemoryImage(image)),
                  );
                });
          }
        },
      ),
    );
  }
}
