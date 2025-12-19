import 'package:flutter/material.dart';

class ModalsScreen extends StatelessWidget {
  const ModalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(children: [Text('This is Modal samples')])),
    );
  }
}
