import 'package:blog/gen/assets.gen.dart';
import 'package:blog/splash_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String instagramId;

  const SecondScreen({super.key, required this.instagramId});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.instagramId),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
