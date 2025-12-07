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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: instagramIdController,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Instagram ID',
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your Instagram ID',
                  helper: Row(
                    children: const [
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

                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.blue, // label color when focused
                    fontWeight: FontWeight.bold,
                  ),
                ),
                cursorColor: Colors.red,
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Facebook ID',
                  icon: const Icon(Icons.facebook),
                  hintText: 'Enter your Facebook ID',
                  helper: Row(
                    children: const [
                      Icon(Icons.facebook, size: 20, color: Colors.blue),
                      SizedBox(width: 5),
                      Text('Example: /facebook_user123'),
                    ],
                  ),
                  prefixText: "@",
                  suffixText: ".official",
                ),
              ),

              const Divider(height: 40, thickness: 2),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(instagramId: instagramIdController.text),
                    ),
                  );
                },
                child: const Text("Second page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
