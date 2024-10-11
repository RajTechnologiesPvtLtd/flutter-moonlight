import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import 'routes/app_pages.dart';

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.name,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
