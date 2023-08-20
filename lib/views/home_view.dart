import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
// import '../services/services.dart';
import '../utils/tools.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  // final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //     icon: const Icon(Icons.logout),
          //     onPressed: () {
          //       _authService.logout();
          //     }),
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Nav.toNamed(context, App.setting))
        ],
      ),
      bottomNavigationBar: const BannerAdWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.appLogo,
            width: 150,
          ),
          const SizedBox(height: 10),
          const Text(
            "Welcome to Moonlight Starter Kit for Flutter",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: TextButton(
                    onPressed: () => mlLaunchURL(AppLink.officialWebsite),
                    child: const Text("Official Website"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: TextButton(
                    onPressed: () => Nav.toNamed(context, App.exampleMVC),
                    child: const Text("Example MVC"),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: TextButton(
                    onPressed: () => Nav.toNamed(context, App.example),
                    child: const Text("Examples"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
