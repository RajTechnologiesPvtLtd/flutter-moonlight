import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:moonlight/widgets/navbar.dart';

class LoadLocalImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title:"Load Local Image"),
      body: Container(
        child: Center(
          child: Text(
            "Hello World!",
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
        // Set the image as the background of the Container
        decoration: BoxDecoration(
            image: DecorationImage(
                // Load image from assets
                image: AssetImage('assets/images/logo.jpg'),
                // Make the image cover the whole area
                fit: BoxFit.cover)),
      ),
    );
  }
}
