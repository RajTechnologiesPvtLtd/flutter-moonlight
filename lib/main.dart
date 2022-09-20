import 'package:flutter/material.dart';
import 'package:moonlight/constants/app.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'views/example/auth/views/register_view.dart';

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
            title: appName,
            theme: lightTheme,
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
