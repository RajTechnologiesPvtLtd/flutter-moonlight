import 'package:flutter/material.dart';

class SnackBarView extends StatelessWidget {
  const SnackBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show SnackBar'),
          // On pressing the raised button
          onPressed: () {
            final snackBar = SnackBar(
              duration: const Duration(seconds: 3),
              content: const Text('Hello! I am SnackBar :)'),
              action: SnackBarAction(
                label: 'Hit Me (Action)',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
