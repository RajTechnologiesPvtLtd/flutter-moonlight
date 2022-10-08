import 'package:flutter/material.dart';
import 'package:moonlight/config/config.dart';
import 'constants/routes.dart';

void main() {
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
              primarySwatch: Colors.blue,
            ),
            // themeMode: ThemeMode.system,
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            initialRoute: rootRoute,
            onGenerateRoute: Routes.generateRoute,
            // home: const RegisterScreen(),
          );
        });
  }
}
