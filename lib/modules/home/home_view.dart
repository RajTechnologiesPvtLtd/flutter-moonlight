import 'package:flutter/material.dart';
import '../../config/config.dart';
import '../../core/classes/classes.dart';
import '../../l10n/app_localizations.dart';
import '../../utils.dart';
import '../../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer(AppLocalizations.of(context)!.home),
      appBar: Navbar(title: AppLocalizations.of(context)!.home),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.appLogo,
              width: 75,
            ),
            sizedBoxByWidth(10),
            const Text(
              "Welcome to Moonlight Starter Kit for Flutter",
              style: TextStyle(fontSize: 18),
            ),
            sizedBoxByWidth(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mlButton(
                  "Official Website",
                  () => mlLaunchURL(AppLink.officialWebsite),
                ),
                sizedBoxByWidth(10),
                mlButton(
                  "Examples",
                  () => Nav.toNamed(context, App.example),
                ),
              ],
            ),
            sizedBoxByWidth(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mlButton(
                  "Example MVC",
                  () => Nav.toNamed(context, App.exampleMVC),
                ),
                sizedBoxByWidth(10),
                mlButton(
                  "Example Bloc",
                  () => Nav.toNamed(context, App.exampleBloc),
                ),
              ],
            ),
            sizedBoxByHeight(10),
            mlButton(
              "Example Getx",
              () => Nav.toNamed(context, App.exampleGetx),
            ),
          ],
        ),
      ),
    );
  }
}
