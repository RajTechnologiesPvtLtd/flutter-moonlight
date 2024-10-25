import 'package:flutter/material.dart';
import '../../config/config.dart';
import '../../core/classes/classes.dart';
import '../../widgets/widgets.dart';

class ExampleAdsView extends StatelessWidget {
  const ExampleAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Ads Examples"),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Banner Ads")),
              onTap: () => Nav.toNamed(context, App.bannerAds),
            ),
            ListTile(
              title: const Center(child: Text("Interstitial Ads")),
              onTap: () => Nav.toNamed(context, App.interstitialAds),
            ),
          ],
        ),
      ),
    );
  }
}
