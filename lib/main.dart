// import 'dart:io';
import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'config/config.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Remote Config
  // if (Platform.isAndroid || Platform.isIOS) {
  //   MobileAds.instance.initialize(); // Google Mobile Ads
  // }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light); // Theme Mode Change
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: AppConfig.name,
            theme: MyTheme().lightTheme,
            darkTheme: MyTheme().darkTheme,
            themeMode: currentMode,
            initialRoute: App.home,
            routes: Routes().routes,
            // Localizations
            locale: const Locale('gu'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        });
  }
}
