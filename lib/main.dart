import 'dart:io';
import 'package:flutter/material.dart';
import 'config/config.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Remote Config
  // await Firebase.initializeApp(); // if used then add on firebase remote config
  // Google Mobile Ads
  if (Platform.isAndroid || Platform.isIOS) {
    MobileAds.instance.initialize();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  // Theme Mode Change Start
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  // Theme Mode Change End
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: AppConfig.name,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme(
                primary: Colors.orange,
                secondary: Colors.amber,
                background: Colors.white,
                surface: Colors.white,
                brightness: Brightness.light,
                error: Colors.red[900]!,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onBackground: Colors.black,
                onSurface: Colors.black,
                onError: Colors.white,
              ),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            initialRoute: App.home,
            routes: Routes().routes,
          );
        });
  }
}
