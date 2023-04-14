import 'package:flutter/material.dart';
import '../config/config.dart';
import '../utils/tools.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      appBar: AppBar(title: const Text("Home")),
      bottomNavigationBar: BannerAdWidget(),
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
                    mlLaunchURL(AppLink.officialWebsite);
                  },
                  child: const Text("Official Website")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(App.example);
                  },
                  child: const Text("Examples")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(App.setting);
                  },
                  child: const Text("Settings")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(App.loadMoreMVC);
                  },
                  child: const Text("load More MVC"))
            ],
          )
        ],
      ),
    );
  }
}
