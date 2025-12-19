import 'package:flutter/material.dart';

class ModalsScreen extends StatelessWidget {
  const ModalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Modal samples')),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('bottomsheet clicked');
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            height: 200,
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                'This is modal bottom sheet',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Show modal bottom sheet'),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          color: Colors.white,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // closes the modal
                              },
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Show bottom sheet'),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Popup Modal'),
                          content: const Text(
                            'This is a modal popup. This is a modal popup. This is a modal popup.',
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // closes the dialog
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show alert dialog'),
                  ),

                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
