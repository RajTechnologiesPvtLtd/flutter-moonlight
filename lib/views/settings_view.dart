import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../constants/app.dart';
import '../utils/tools.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final bool _toggleDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              leading: Icon(Icons.translate),
              title: Text("Language"),
              trailing: Icon(Icons.navigate_next)),
          SwitchListTile(
            title: Text('Dark Mode'),
            secondary: Icon(Icons.dark_mode),
            onChanged: (_) {},
            value: _toggleDarkMode,
          ),
          Visibility(
              visible: (Platform.isAndroid || Platform.isIOS) ? true : false,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share The App"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (() {
                      Share.share('check out my website https://example.com');
                    }),
                  ),
                  ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Rate This App"),
                      trailing: Icon(Icons.navigate_next),
                      onTap: (() {})),
                ],
              )),
          Center(
            child: Text("Pages"),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Terms & Conditions"),
            trailing: Icon(Icons.navigate_next),
            onTap: (() {
              launchURL(appTermsConditionsURL);
            }),
          ),
          ListTile(
            leading: Icon(Icons.gavel),
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.navigate_next),
            onTap: (() {
              launchURL(appPrivacyPolicyURL);
            }),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            trailing: Icon(Icons.navigate_next),
            onTap: (() {
              launchURL(appAboutUsURL);
            }),
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text("Contact Us"),
            trailing: Icon(Icons.navigate_next),
            onTap: (() {
              launchURL(appContactUsURL);
            }),
          ),
        ],
      ),
    );
  }
}
