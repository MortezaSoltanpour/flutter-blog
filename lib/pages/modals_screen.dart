import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ModalsScreen extends StatelessWidget {
  const ModalsScreen({super.key});

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
        appBar: AppBar(title: Text('Modal samples')),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // Modal bottom sheet
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

                  // bottom sheet
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

                  // Dialog
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
                  ElevatedButton(
                    onPressed: () async {
                      final controller = TextEditingController();
                      final result = await showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Enter your name'),
                          content: TextField(controller: controller),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, controller.text),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );

                      if (result != null && result.isNotEmpty) {
                        print('User input: $result');
                      }
                    },
                    child: const Text('Show input dialog'),
                  ),

                  SizedBox(height: 20),
                  // GeneralDialog
                  ElevatedButton(
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'Custom Dialog 2',
                        pageBuilder: (context, animation1, animation2) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: const Color.fromARGB(255, 255, 222, 172),
                            ),
                            width: 300,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Custom Dialog',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),

                                  'Culpa labore aliquip minim tempor consequat anim veniam adipisicing consectetur est labore occaecat. Proident esse sunt sunt proident pariatur ad incididunt tempor officia irure id excepteur tempor. Veniam excepteur consectetur exercitation aliquip duis Lorem laboris est enim. Excepteur aute voluptate nostrud enim consequat proident aute.',
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Show Custom Dialog'),
                  ),

                  SizedBox(height: 20),

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
