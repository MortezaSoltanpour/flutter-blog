import 'package:blog/constants/myColors.dart';
import 'package:blog/home_screen.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              InkWell(
                splashColor: SolidColors.primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screen.width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: const Text(
                      'Main page',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: SolidColors.deviderColor,
                endIndent: 20,
                indent: 20,
              ),
              InkWell(
                splashColor: SolidColors.primaryColor,
                onTap: () {
                  print('salam');
                },
                child: Container(
                  width: screen.width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: const Text('Modals', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: SolidColors.deviderColor,
                endIndent: 20,
                indent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
