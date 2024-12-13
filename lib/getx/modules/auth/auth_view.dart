import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import 'auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.appLogo,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sign In",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.emailCtr,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Email'
                  : null;
            },
            decoration: inputDecoration('E-mail'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Password'
                  : null;
            },
            controller: controller.passwordCtr,
            decoration: inputDecoration('Password'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: controller.login,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
              backgroundColor: Get.theme.primaryColor,
              foregroundColor: Get.theme.colorScheme.onPrimary,
            ),
            child: const Text("Sign in"),
          ),
          TextButton(
            onPressed: () => controller.switchFormType(),
            child: Text.rich(
              TextSpan(
                text: "Don’t have an account? ",
                style: TextStyle(color: Get.theme.hintColor),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(color: Get.theme.colorScheme.primary),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.appLogo,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.emailCtr,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Email'
                  : null;
            },
            decoration: inputDecoration('E-mail'),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please Enter Password'
                  : null;
            },
            controller: controller.passwordCtr,
            decoration: inputDecoration('Password'),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            validator: (value) {
              return (value == null ||
                      value.isEmpty ||
                      value != controller.passwordCtr.text)
                  ? 'Passwords does not match'
                  : null;
            },
            decoration: inputDecoration('Retype Password'),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: controller.register,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
              backgroundColor: Get.theme.primaryColor,
              foregroundColor: Get.theme.colorScheme.onPrimary,
            ),
            child: const Text("Sign Up"),
          ),
          TextButton(
            onPressed: () => controller.switchFormType(),
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Get.theme.hintColor),
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(color: Get.theme.colorScheme.primary),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: (controller.formType == FormType.login)
                ? loginForm()
                : registerForm(),
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String labelText) {
  return InputDecoration(
    hintText: labelText,
    filled: true,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
}
