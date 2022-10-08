import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moonlight/config/config.dart';
import '../main.dart';
import '../utils/tools.dart';
import '../widgets/drawer.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer("Settings"),
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text("App Settings",
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            ListTile(
              leading: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              title: MyApp.themeNotifier.value == ThemeMode.light
                  ? Text("Dark Mode")
                  : Text("Light Mode"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              }),
            ),
            Center(
              child: Text("Help",
                  style: TextStyle(fontWeight: FontWeight.w500)), //Pages
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text("Contact Us"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                launchURL(AppLink.contactUs);
              }),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("FAQ"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                launchURL(AppLink.contactUs);
              }),
            ),
            Center(
              child: Text("Contact Channels",
                  style: TextStyle(fontWeight: FontWeight.w500)), //Pages
            ),
            Visibility(
                visible: AppLink.officialWebsite.isNotEmpty,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Official Website"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (() {
                    launchURL(AppLink.officialWebsite);
                  }),
                )),
            Visibility(
                visible: AppLink.youtube.isNotEmpty,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("YouTube"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (() {
                    launchURL(AppLink.youtube);
                  }),
                )),
            Visibility(
                visible: AppLink.instagram.isNotEmpty,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Instagram"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (() {
                    launchURL(AppLink.instagram);
                  }),
                )),
            Visibility(
                visible: AppLink.facebook.isNotEmpty,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Facebook"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (() {
                    launchURL(AppLink.facebook);
                  }),
                )),
            Visibility(
                visible: AppLink.twitter.isNotEmpty,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Twitter"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: (() {
                    launchURL(AppLink.twitter);
                  }),
                )),
            Center(
              child: Text(
                "About App",
                style: TextStyle(fontWeight: FontWeight.w500),
              ), //Pages
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text("Terms & Conditions"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                launchURL(AppLink.termsAndConditions);
              }),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                launchURL(AppLink.aboutUs);
              }),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share The App"),
              trailing: Icon(Icons.navigate_next),
              onTap: (() {
                CustomShare(AppConfig.shareTheAppMsg);
              }),
            ),
            ListTile(
                leading: Icon(Icons.star),
                title: Text("Rate This App"),
                trailing: Icon(Icons.navigate_next),
                onTap: (() {
                  launchURL(AppConfig.rateThisAppLink);
                }))
          ],
        ),
      ),
    );
  }
}
