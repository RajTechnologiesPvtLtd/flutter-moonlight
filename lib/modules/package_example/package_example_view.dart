import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../core/classes/classes.dart';
import '../../widgets/widgets.dart';

class PackageExampleView extends StatelessWidget {
  const PackageExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Package Examples"),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Provider")),
              onTap: () => Nav.toNamed(context, App.exampleProvider),
            ),
            ListTile(
              title: const Center(child: Text("Youtube Video")),
              onTap: () => Nav.toNamed(context, App.exampleYoutubeVideo),
            ),
            ListTile(
              title: const Center(child: Text("Firebase Remote Config")),
              onTap: () =>
                  Nav.toNamed(context, App.exampleFirebaseRemoteConfig),
            ),
            ListTile(
              title: const Center(child: Text("Check Internet Connection")),
              onTap: () =>
                  Nav.toNamed(context, App.exampleCheckInternetConnection),
            ),
            ListTile(
              title: const Center(child: Text("Permission Handler")),
              onTap: () => Nav.toNamed(context, App.examplePermissionHandler),
            ),
            ListTile(
              title: const Center(child: Text("Geo Location")),
              onTap: () => Nav.toNamed(context, App.exampleGeoLocation),
            ),
          ],
        ),
      ),
    );
  }
}
