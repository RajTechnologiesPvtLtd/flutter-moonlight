import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer("Home"),
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Text("Welcome to Flutter Moonlight Framework"),
      ),
    );
  }
}
