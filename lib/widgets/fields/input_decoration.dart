import 'package:flutter/material.dart';

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText, String? hintText}) {
  return InputDecoration(
    // contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    // labelStyle: TextStyle(color: Colors.grey),
    // fillColor: Colors.grey.shade200,
    // filled: true,
    prefixText: prefix,
    // prefixIcon: Icon(
    //   iconData,
    //   size: 20,
    // ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    // enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
  );
}
