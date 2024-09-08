import 'dart:io';
import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'config/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/app_settings.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzbSzCn1N6LWIe6wthYyrgUUSAlUsdqMb-wvTo',
      appId: '1:123456789000:android:f1bf012572b04063',
      messagingSenderId: 'sendid',
      projectId: 'mockproject-1234',
      storageBucket: 'mockproject-1234.appspot.com',
    ),
  ); // Remote Config
  if (Platform.isAndroid || Platform.isIOS) {
    MobileAds.instance.initialize(); // Google Mobile Ads
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static AppSettingsNotifier appSettingsNotifier = AppSettingsNotifier(
    AppSettings(themeMode: ThemeMode.system, locale: const Locale('en')),
  );
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppSettings>(
      valueListenable: appSettingsNotifier,
      builder: (_, AppSettings appSettings, __) {
        return MaterialApp(
          title: AppConfig.name,
          theme: MyTheme().lightTheme,
          darkTheme: MyTheme().darkTheme,
          themeMode: appSettings.themeMode,
          initialRoute: App.home,
          routes: Routes().routes,
          // Localizations
          locale: appSettings.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}

/*
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
            locale: Locale(AppConfig.defaultLanguage),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        });
  }
}
*/