import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

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

// Validator
String? customTextValidator(value) {
  return (value == null || value.isEmpty) ? 'Please Enter First Name' : null;
}

String? customEmailValidator(value) {
  return (!value.isEmpty && !RegExp(r'\S+@\S+\.\S+').hasMatch(value))
      ? 'Please enter a valid email address'
      : null;
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText, String? hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
  );
}
