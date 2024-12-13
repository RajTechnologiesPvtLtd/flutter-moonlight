import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/modules.dart';
import '../routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    final isLogged = Get.find<AuthController>().isLogged.value;
    // Avoid redirection if already on the target route
    if (isLogged && route != Routes.home) {
      return const RouteSettings(name: Routes.home);
    } else if (!isLogged && route != Routes.auth) {
      return const RouteSettings(name: Routes.auth);
    }
    return null;
  }
}
