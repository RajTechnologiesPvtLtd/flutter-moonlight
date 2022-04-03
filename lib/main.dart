import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/menu_controller.dart';
import 'controllers/navigation_controller.dart';
import 'layout.dart';
import 'constants/app.dart';
import 'views/auth/splash_page.dart';
import 'views/errors/404.dart';
import 'routes/routes.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Moon Light',
      home: SiteLayout(),
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: rootRoute,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => NotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(name: loginPageRoute, page: () => SplashView()),
      ],
    );
  }
}
