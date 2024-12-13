import 'package:get/get.dart';

import 'middlewares/middlewares.dart';
import 'modules/modules.dart';

abstract class Routes {
  Routes._();
  static const auth = '/auth';
  static const home = '/home';
  static const items = '/items';
}

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.items,
      page: () => const ItemView(),
      binding: ItemBinding(),
    ),
  ];
}