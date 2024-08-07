import 'package:flutter/material.dart';
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
    );
  }
}
