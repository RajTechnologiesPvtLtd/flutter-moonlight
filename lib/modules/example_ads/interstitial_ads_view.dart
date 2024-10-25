import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moonlight/config/config.dart';

class InterstitialAdsView extends StatefulWidget {
  const InterstitialAdsView({super.key});

  @override
  State<InterstitialAdsView> createState() => _InterstitialAdsViewState();
}

class _InterstitialAdsViewState extends State<InterstitialAdsView> {
  late InterstitialAd interstitialAd;
  bool _isAdLoad = false;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  void loadAd() {
    InterstitialAd.load(
        adUnitId: AppConfig.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
            setState(() {
              _isAdLoad = true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
            interstitialAd.dispose();
            setState(() {
              _isAdLoad = false;
            });
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interstitial Ads View')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (_isAdLoad) {
              interstitialAd.show();
            }
          },
          child: const Text("Show Interstitial Ads"),
        ),
      ),
    );
  }
}
