import 'package:get/get.dart';

import 'modules/modules.dart';

abstract class Routes {
  Routes._();
  static const home = '/home';
  static const login = '/login';
}

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // Auth
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
  ];
}
