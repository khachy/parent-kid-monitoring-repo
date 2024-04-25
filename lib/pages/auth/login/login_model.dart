import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  // controllers
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get passwordController => _passwordController;


  // a key for validating the form
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
}