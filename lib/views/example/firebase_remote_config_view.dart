import 'package:flutter/material.dart';
import '../../core/classes/classes.dart';

class FirebaseRemoteConfigView extends StatefulWidget {
  const FirebaseRemoteConfigView({super.key});

  @override
  State<FirebaseRemoteConfigView> createState() =>
      _FirebaseRemoteConfigViewState();
}

class _FirebaseRemoteConfigViewState extends State<FirebaseRemoteConfigView> {
  final MLRemoteConfig _mlRemoteConfig = MLRemoteConfig();

  @override
  void initState() {
    _mlRemoteConfig.initConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: Center(
        child: Text(_mlRemoteConfig.remoteConfig.getString('test_x')),
      ),
    );
  }
}
