import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class MLRemoteConfig {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  applyDefaultConfig() {
    // Apply default values for remote config parameters
    remoteConfig.setDefaults({
      'test_x': "TEST X",
    });
  }

  // Fetching, caching, and activating remote config
  Future<void> fetchConfig() async {
    try {
      await remoteConfig.fetchAndActivate();
    } catch (error) {
      // Fetch and activate failed, handle the error
      debugPrint('Failed to fetch and activate remote config: $error');
      // Apply default values
      applyDefaultConfig();
    }
  }

  Future<void> initConfig() async {
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 10),
      ));
      await fetchConfig();
    } catch (error) {
      // Fetch config failed, handle the error
      debugPrint('Failed to fetch remote config: $error');
      // Apply default values
      applyDefaultConfig();
    }
  }
}
