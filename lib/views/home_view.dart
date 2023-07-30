import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
import '../services/services.dart';
import '../utils/tools.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      // appBar: const Navbar(title: "Home"),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _authService.logout();
                // Nav.to(context, App.loginAuth);
              })
        ],
      ),
      bottomNavigationBar: const BannerAdWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome to Flutter Moonlight Framework"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => mlLaunchURL(AppLink.officialWebsite),
                  child: const Text("Official Website")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.setting),
                  child: const Text("Settings")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.example),
                  child: const Text("Examples")),
              const SizedBox(width: 2),
              ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.exampleMVC),
                  child: const Text("Example MVC")),
            ],
          )
        ],
      ),
    );
  }
}
