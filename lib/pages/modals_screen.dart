import 'package:flutter/material.dart';

class ModalsScreen extends StatelessWidget {
  const ModalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Modal samples')),
        body: Center(
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
                child: Text('Show bottom sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
