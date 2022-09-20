import 'package:flutter/material.dart';

class UsingAlertDialogView extends StatefulWidget {
  const UsingAlertDialogView({Key? key}) : super(key: key);

  @override
  State<UsingAlertDialogView> createState() => _UsingAlertDialogViewState();
}

class _UsingAlertDialogViewState extends State<UsingAlertDialogView> {
  AlertDialog dialog = AlertDialog(
      content: Text(
    "Hello World!",
    style: TextStyle(fontSize: 30.0),
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Using Alert Dialog"),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
                child: Text("Hit to alert!"),
                // On press of the button
                onPressed: () {
                  // Show dialog
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                }),
          ),
        ));
  }
}
