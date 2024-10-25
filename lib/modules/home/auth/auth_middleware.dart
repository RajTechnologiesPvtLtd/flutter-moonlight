import 'package:flutter/material.dart';
import '../../../config/config.dart';
import '../../../core/classes/classes.dart';
import 'auth_service.dart';

class AuthMiddleware extends NavigatorObserver {
  final AuthService authService;

  AuthMiddleware(this.authService);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name == '/login') {
      // Check if the user is already logged in
      if (authService.isLoggedIn()) {
        // User is already logged in, redirect to home page
        // Navigator.of(route.navigator!.context).pushReplacementNamed('/home');
        Nav.to(route.navigator!.context, App.home);
      }
      Nav.to(route.navigator!.context, App.loginAuth);
    }
  }
}
