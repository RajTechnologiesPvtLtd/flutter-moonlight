import 'package:flutter/material.dart';

Widget onScreenLoader() {
  return const Padding(
    padding: EdgeInsets.only(top: 10, bottom: 40),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
