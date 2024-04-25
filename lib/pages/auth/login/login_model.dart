import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginModel extends ChangeNotifier {
  // controllers
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;


  // a key for validating the form
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  // method for signing users in
  Future<void> loginUser() async {
    var response = await http.post(
      Uri.parse('http://172.31.10.127:8000/api/users/login/'),
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'username': _userNameController.text.trim(),
        'password': _passwordController.text.trim(),
      }),
    ).timeout(const Duration(seconds: 30));

    print('Response: ${response.statusCode}');
    print('Api Response: ${response.body}');
  }
}