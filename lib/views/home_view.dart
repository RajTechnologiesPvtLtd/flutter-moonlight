import 'package:flutter/material.dart';
import '../config/config.dart';
import '../constants/routes.dart';
import '../utils/tools.dart';
import '../widgets/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome to Flutter Moonlight Framework"),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    launchURL(AppLink.officialWebsite);
                  },
                  child: const Text("Official Website")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(exampleRoute);
                  },
                  child: const Text("Examples")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(settingRoute);
                  },
                  child: const Text("Settings"))
            ],
          )
        ],
      ),
    );
  }
}
