import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/modules.dart';
import 'routes.dart';

class AppConfig {
  static const String name = 'MoonLight';
  static String cacheIsOnboarding = "isOnboarding";
}

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    // AppTranslations.init();
    Get.put(AppController());
    Get.put(AuthController());
    return GetMaterialApp(
      title: AppConfig.name,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      // locale: const Locale('en', 'US'),
      // translations: AppTranslations(),
      // fallbackLocale: const Locale('en'),
    );
  }
}
