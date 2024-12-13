import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import 'modules/modules.dart';
import 'routes.dart';

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
      title: AppConfig.name,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
