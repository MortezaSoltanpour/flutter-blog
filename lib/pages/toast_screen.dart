import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastScreen extends StatelessWidget {
  const ToastScreen({super.key});

  void showCustomToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 20,
        right: 20,
        child: Material(
          color: const Color.fromARGB(137, 0, 0, 0),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () => overlayEntry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Toasts samples')),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // Snack bar
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('This is a Snackbar / Toast'),
                          duration: Duration(seconds: 4),
                          elevation: 6,
                          persist: false,
                          showCloseIcon: true,
                        ),
                      );
                    },
                    child: const Text('Show Snackbar / Toast'),
                  ),
                  SizedBox(height: 20),
                  // Flutter toast
                  ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "This is a toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM, // TOP, CENTER
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: const Text('Show flutter toast'),
                  ),

                  SizedBox(height: 20),
                  // Custome toast message
                  ElevatedButton(
                    onPressed: () =>
                        showCustomToast(context, "This is a Custom Toast"),
                    child: const Text('Show Custom Toast'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
