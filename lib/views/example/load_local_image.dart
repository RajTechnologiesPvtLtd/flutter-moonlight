import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class LoadLocalImagePage extends StatelessWidget {
  const LoadLocalImagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Load Local Image"),
      body: Container(
        child: Center(
          child: const Text(
            "Hello World!",
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
        // Set the image as the background of the Container
        decoration: const BoxDecoration(
            image: DecorationImage(
                // Load image from assets
                image: AssetImage('assets/images/logo.jpg'),
                // Make the image cover the whole area
                fit: BoxFit.cover)),
      ),
    );
  }
}
