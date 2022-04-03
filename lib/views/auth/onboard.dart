import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authentication_manager.dart';
import 'home_view.dart';
import 'login_page.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? HomeView() : LoginPage();
    });
  }
}
