import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/Scan.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String? qrdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 52, 113, 162),
          title: const Text(
            "GENERATE QR CODE",
            style: TextStyle(
                color: Color.fromARGB(179, 202, 197, 197),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Scan()));
                },
                icon: const Icon(Icons.qr_code_scanner))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    qrdata = value;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
