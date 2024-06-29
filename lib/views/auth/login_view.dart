import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../core/classes/classes.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> loginUser(String email, String password) async {
    final response = await _authService
        .login(LoginRequestModel(email: email, password: password));
    if (response != null) {
      /// Set isLogin to true6
      // _authManager.login(response.token.toString());
      Nav.to(context, App.home);
    } else {
      /// Show user a dialog about the error response
      showMessage(context, "Please enter a valid data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://www.rajtechnologies.com/ui/images/raj-technologies-logo-top-panel.jpg",
                width: 100,
                height: 100,
              ),
              MLTextField(
                controller: _emailCtr,
                labelText: "Email",
              ),
              MLPasswordField(
                controller: _passwordCtr,
                labelText: "Password",
              ),
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  loginUser(_emailCtr.text, _passwordCtr.text);
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
