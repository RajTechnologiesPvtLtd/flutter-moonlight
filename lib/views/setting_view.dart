import 'package:flutter/material.dart';
import 'package:moonlight/core/app_settings.dart';
import '../main.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../core/classes/classes.dart';
import '../config/config.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings appSettings = MainApp.appSettingsNotifier.value;
    return Scaffold(
      appBar: const Navbar(title: "Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text("App Settings",
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            ListTile(
              leading: Icon(appSettings.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              title: appSettings.themeMode == ThemeMode.light
                  ? const Text("Dark Mode")
                  : const Text("Light Mode"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                changeTheme(appSettings.themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light);
                // MainApp.themeNotifier.value =
                //     MainApp.themeNotifier.value == ThemeMode.light
                //         ? ThemeMode.dark
                //         : ThemeMode.light;
              }),
            ),
            ListTile(
              leading: const Icon(Icons.cached_outlined),
              title: const Text("API Cache Clear"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                CacheManager.clearData();
                showMessage(context, "API cache clear successfully.");
              }),
            ),
            Row(
              children: [
                Expanded(
                  child: mlButton("English", () {
                    // _provider.setLocale('en');
                    changeLanguage('en');
                  }),
                ),
                sizedBoxByWidth(5),
                Expanded(
                  child: mlButton("ગુજરાતી", () {
                    // _provider.setLocale('gu');
                    changeLanguage('gu');
                  }),
                ),
                sizedBoxByWidth(5),
                Expanded(
                  child: mlButton("हिंदी", () {
                    // _provider.setLocale('hi');
                    changeLanguage('hi');
                  }),
                ),
              ],
            ),
            const Center(
              child: Text(
                "Rating & Share",
                style: TextStyle(fontWeight: FontWeight.w500),
              ), //Pages
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share The App"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                mlShare(AppConfig.shareTheAppMsg);
              }),
            ),
            ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Rate This App"),
                trailing: const Icon(Icons.navigate_next),
                onTap: (() {
                  mlShare(AppConfig.rateThisAppLink);
                })),
            const Center(
              child: Text(
                "About App",
                style: TextStyle(fontWeight: FontWeight.w500),
              ), //Pages
            ),
            Visibility(
                visible: AppLink.officialWebsite.isNotEmpty,
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Official Website"),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: (() {
                    mlLaunchURL(AppLink.officialWebsite);
                  }),
                )),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About Us"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                mlLaunchURL(AppLink.aboutUs);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text("Contact Us"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                mlLaunchURL(AppLink.contactUs);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text("Terms & Conditions"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                mlLaunchURL(AppLink.termsAndConditions);
              }),
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text("Privacy Policy"),
              trailing: const Icon(Icons.navigate_next),
              onTap: (() {
                mlLaunchURL(AppLink.privacyPolicy);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
