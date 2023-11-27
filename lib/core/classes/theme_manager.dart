import 'package:flutter/material.dart';

class AppTheme {
  ThemeData? light;
  ThemeData? dark;

  AppTheme([
    this.light,
    this.dark,
  ]) {
    light = light ??
        ThemeData(
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
        );
    dark = dark ?? ThemeData.dark(useMaterial3: true);
  }

  ThemeData get lightTheme => light!;
  ThemeData get darkTheme => dark!;

  AppTheme copyWith({
    ThemeData? light,
    ThemeData? dark,
  }) {
    return AppTheme(
      light ?? this.light,
      dark ?? this.dark,
    );
  }
}
