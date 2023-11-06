import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class BannerAdsView extends StatelessWidget {
  const BannerAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banner Ads View')),
      body: const Center(
        child: Text("Banner Ads"),
      ),
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}
