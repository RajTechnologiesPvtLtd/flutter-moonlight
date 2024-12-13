import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'models/models.dart';
import '../../routes.dart';
import '../../services/services.dart';

enum FormType { login, register }

class AuthController extends GetxController with CacheManager {
  late final LoginService _loginService;
  Rx<FormType> formType = FormType.login.obs;

  RxBool isLogged = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
  }

  // void checkLoginStatus() {
  //   final token = getToken();
  //   if (token != null) {
  //     isLogged.value = true;
  //   }
  // }

  switchFormType() {
    if (formType.value == FormType.login) {
      formType.value = FormType.register;
    } else {
      formType.value = FormType.login;
    }
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      loginUser(emailCtr.text, passwordCtr.text);
    }
  }

  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      registerUser(emailCtr.text, passwordCtr.text);
    }
  }

  Future<void> logOut() async {
    isLogged.value = false;
    await removeToken();
    Get.offAllNamed(Routes.auth);
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));
    if (response != null && response.token!.isNotEmpty) {
      await saveToken(response.token);
      isLogged.value = true;
      // Redirect to the home screen
      Get.offAllNamed(Routes.home);
    } else {
      isLogged.value = false;

      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: 'User not found!',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  Future<void> registerUser(String email, String password) async {
    final response = await _loginService
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null && response.token!.isNotEmpty) {
      await saveToken(response.token);
      isLogged.value = true;
    } else {
      isLogged.value = false;

      /// Show user a dialog about the error response
      Get.defaultDialog(
        middleText: 'Register Error',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
