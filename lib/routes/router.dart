import 'package:flutter/material.dart';
import '../views/settings_view.dart';
import '../views/home_view.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return _getPageRoute(HomePage());
    case settingsPageRoute:
      return _getPageRoute(SettingsPage());
    default:
      return _getPageRoute(HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
