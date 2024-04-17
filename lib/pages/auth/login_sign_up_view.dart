import 'package:flutter/material.dart';
import 'package:parent_kid_monitoring_app/pages/auth/login/login_view.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/sign_up_view.dart';

class LoginOrSignUpView extends StatefulWidget {
  const LoginOrSignUpView({super.key});

  @override
  State<LoginOrSignUpView> createState() => _LoginOrSignUpViewState();
}

class _LoginOrSignUpViewState extends State<LoginOrSignUpView> {
  // variable to store the interaction
  bool isLoginScreen = true;
  // for toggling between login and sign up screens
  void toggleScreens() {
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }

  Widget screens() {
    if (isLoginScreen) {
      return LoginView(
        onTap: toggleScreens,
      );
    } else {
      return SignUpView(
        onTap: toggleScreens,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return screens();
  }
}