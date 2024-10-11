import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
// import '../services/services.dart';
import '../l10n/app_localizations.dart';
import '../utils/tools.dart';
import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  // final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer(AppLocalizations.of(context)!.home),
      appBar: Navbar(title: AppLocalizations.of(context)!.home),
      // appBar: AppBar(
      //   title: const Text(
      //     "Home",
      //   ),
      //   actions: [
      //     IconButton(
      //         icon: const Icon(Icons.logout),
      //         onPressed: () {
      //           // _authService.logout();
      //         }),
      //     IconButton(
      //         icon: const Icon(Icons.settings),
      //         onPressed: () => Nav.toNamed(context, App.setting))
      //   ],
      // ),
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
                ElevatedButton(
                  onPressed: () => mlLaunchURL(AppLink.officialWebsite),
                  child: const Text("Official Website"),
                ),
                sizedBoxByWidth(10),
                ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.example),
                  child: const Text("Examples"),
                ),
              ],
            ),
            sizedBoxByWidth(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.exampleMVC),
                  child: const Text("Example MVC"),
                ),
                sizedBoxByWidth(10),
                ElevatedButton(
                  onPressed: () => Nav.toNamed(context, App.exampleBloc),
                  child: const Text("Example Bloc"),
                ),
              ],
            ),
            sizedBoxByHeight(10),
            ElevatedButton(
              onPressed: () => Nav.toNamed(context, App.exampleGetx),
              child: const Text("Example Getx"),
            ),
          ],
        ),
      ),
    );
  }
}
