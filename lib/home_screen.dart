import 'package:blog/gen/assets.gen.dart';
import 'package:blog/second_screen.dart';
import 'package:blog/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController instagramIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: instagramIdController,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 133, 18),
                      ),
                    ),
                    labelText: 'Instagram ID',
                    icon: Icon(Icons.person),
                    hint: Text('Enter your Instagram ID'),
                    // helperText: 'This is your unique Instagram identifier',
                    helper: Row(
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_badge_plus,
                          size: 20,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text('Example: instagram_user123'),
                      ],
                    ),

                    prefixText: "@",
                    suffixText: ".official",
                    // counterText: "Max 30 characters",
                    counterStyle: TextStyle(color: Colors.red),
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 133, 18),
                      ),
                    ),
                    labelText: 'Facebook ID',
                    icon: Icon(Icons.facebook),
                    hint: Text('Enter your Facebook ID'),
                    // helperText: 'This is your unique Instagram identifier',
                    helper: Row(
                      children: [
                        Icon(Icons.facebook, size: 20, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('Example: /facebook_user123'),
                      ],
                    ),

                    prefixText: "@",
                    suffixText: ".official",
                    // counterText: "Max 30 characters",
                    counterStyle: TextStyle(color: Colors.red),
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
                Divider(height: 40, thickness: 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            instagramId: instagramIdController.text,
                          ),
                        ),
                      );
                    },
                    child: Text("Second page"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
