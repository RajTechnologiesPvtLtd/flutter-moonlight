import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

calling(phone) async {
  // const url = 'tel:+12345678';
  var url = 'tel:' + phone;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

void CustomShare(message) async {
  return Share.share(message);
}

CustomGoBack(BuildContext context) {
  Navigator.pop(context);
}

//new
void _showUrl() {
  _launch('http://www.nandiraju.com');
}

void _showEmail(email) {
  _launch('mailto:srikanth@nandiraj.com');
}

void _showTelephone(phone) {
  _launch('tel:' + phone);
}

void _showSms(phone) {
  _launch('sms:' + phone);
}

void _launch(String urlString) async {
  if (!await launch(urlString)) throw 'Could not launch $urlString';
}
