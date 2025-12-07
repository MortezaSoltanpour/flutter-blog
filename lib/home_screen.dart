import 'package:blog/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("This is a sample app", style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
