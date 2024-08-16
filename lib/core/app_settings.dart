import 'package:flutter/material.dart';

class AppSettings {
  ThemeMode themeMode;
  Locale locale;

  AppSettings({required this.themeMode, required this.locale});
}

class AppSettingsNotifier extends ValueNotifier<AppSettings> {
  AppSettingsNotifier(super.value);

  void updateTheme(ThemeMode newTheme) {
    value = AppSettings(themeMode: newTheme, locale: value.locale);
  }

  void updateLocale(Locale newLocale) {
    value = AppSettings(themeMode: value.themeMode, locale: newLocale);
  }
}
