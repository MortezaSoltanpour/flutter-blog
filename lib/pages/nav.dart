import 'package:blog/constants/myColors.dart';
import 'package:blog/home_screen.dart';
import 'package:blog/pages/modals_screen.dart';
import 'package:blog/pages/toast_screen.dart';
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
              NavBarItem(
                screen: screen,
                title: 'Main page',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              Divider(
                thickness: 2,
                color: SolidColors.deviderColor,
                endIndent: 20,
                indent: 20,
              ),
              NavBarItem(
                screen: screen,
                title: 'Modals',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ModalsScreen(),
                    ),
                  );
                },
              ),

              Divider(
                thickness: 2,
                color: SolidColors.deviderColor,
                endIndent: 20,
                indent: 20,
              ),
              NavBarItem(
                screen: screen,
                title: 'Toasts',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ToastScreen(),
                    ),
                  );
                },
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

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.screen,
    required this.title,
    required this.onTap,
  });

  final Size screen;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: SolidColors.primaryColor,
      // onTap: () {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => const HomeScreen()),
      //   );
      // },
      onTap: onTap,
      child: Container(
        width: screen.width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(child: Text(title, style: TextStyle(fontSize: 16))),
      ),
    );
  }
}
