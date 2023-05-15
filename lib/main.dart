import 'package:flutter/material.dart';
import 'config/config.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Google Mobile Ads Start
  MobileAds.instance.initialize();
  // Google Mobile Ads End

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Theme Mode Change Start
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  // Theme Mode Change End
  const MyApp({Key? key}) : super(key: key);

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
