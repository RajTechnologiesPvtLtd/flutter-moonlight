import 'package:flutter/material.dart';

class UsingAlertDialogView extends StatefulWidget {
  const UsingAlertDialogView({super.key});

  @override
  State<UsingAlertDialogView> createState() => _UsingAlertDialogViewState();
}

class _UsingAlertDialogViewState extends State<UsingAlertDialogView> {
  AlertDialog dialog = const AlertDialog(
      content: Text(
    "Hello World!",
    style: TextStyle(fontSize: 30.0),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using Alert Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Hit to alert!"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => dialog,
            );
          },
        ),
      ),
    );
  }
}
