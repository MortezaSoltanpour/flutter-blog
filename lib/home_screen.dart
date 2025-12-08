import 'package:blog/gen/assets.gen.dart';
import 'package:blog/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController instagramIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(10, 10, 10, 0),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Image(
                    width: size.height / 8.6,
                    image: Assets.images.logo.image().image,
                  ),
                  Row(children: [Icon(Icons.search)]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
