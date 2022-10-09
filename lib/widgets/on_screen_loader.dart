import 'package:flutter/material.dart';

class OnScreenLoader extends StatelessWidget {
  const OnScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 40),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
