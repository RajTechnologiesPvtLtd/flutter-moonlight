import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../config/config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  // Remote Config Start
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> _initConfig() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 10),
      ));
      await _fetchConfig();
    } catch (e) {
      // Fetch config failed, handle the error
      print('Failed to fetch remote config: $e');
      // Apply default values
      _applyDefaultConfig();
    }
  }

  // Fetching, caching, and activating remote config
  Future<void> _fetchConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      // Fetch and activate failed, handle the error
      print('Failed to fetch and activate remote config: $e');
      // Apply default values
      _applyDefaultConfig();
    }
  }

  void _applyDefaultConfig() {
    // Apply default values for remote config parameters
    _remoteConfig.setDefaults({
      'banner_ad': AppConfig.bannerAdUnitId,
    });
  }

  // Remote Config End
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _initConfig();

    _bannerAd = BannerAd(
      adUnitId: _remoteConfig.getString('banner_ad').isNotEmpty
          ? _remoteConfig.getString('banner_ad')
          : AppConfig.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd),
    );
  }
}
