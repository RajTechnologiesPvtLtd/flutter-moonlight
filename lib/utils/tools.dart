import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

void mlLaunchURL(url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

Future<Future<ShareResult>> mlShare(message) async {
  return Share.share(message);
}

mlGoBack(BuildContext context) {
  Navigator.pop(context);
}

//new
void showUrl(String url) {
  _launch(url);
}

void showEmail(String email) {
  _launch('mailto:$email');
}

void showTelephone(String phone) {
  _launch('tel:$phone');
}

void showSms(String phone) {
  _launch('sms:$phone');
}

void _launch(String urlString) async {
  if (!await launch(urlString)) throw 'Could not launch $urlString';
}

void changeTheme(ThemeMode themeMode) {
  MainApp.appSettingsNotifier.updateTheme(themeMode);
}

void changeLanguage(String languageCode) {
  MainApp.appSettingsNotifier.updateLocale(Locale(languageCode));
}
