// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SignUpModel extends ChangeNotifier {
  // controllers for parent/guardian
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailAddressController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailAddressController => _emailAddressController;

  // controllers for ward
  final _wardFirstNameController = TextEditingController();
  final _wardLastNameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _regNoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _wardEmailAddressController = TextEditingController();

  TextEditingController get wardFirstNameController => _wardFirstNameController;
  TextEditingController get wardLastNameController => _wardLastNameController;
  TextEditingController get departmentController => _departmentController;
  TextEditingController get regNoController => _regNoController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get wardEmailAddressController => _wardEmailAddressController;


  // a key for validating the form
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  // a key for validating the form
  final _formKeyForWard = GlobalKey<FormState>();

  GlobalKey<FormState> get formKeyForWard => _formKeyForWard;

   String _selectedRelationship = '-Select-';
  String get selectedRelationship => _selectedRelationship;

  List relationship = [
    ['Guardian', false],
    ['Parent', false],
  ];
  bool _isMenuVisible = false;
  bool get isMenuVisible => _isMenuVisible; // Initially hide the menu

  onTap() {
    _isMenuVisible = !isMenuVisible;
    notifyListeners();
  }

  void relationshipTapped(int index, VoidCallback onTap) {
    for (var i = 0; i < relationship.length; i++) {
      relationship[i][1] = false;
    }
      relationship[index][1] = true;
      _selectedRelationship = relationship[index][0];
      _isMenuVisible = false; // Hide the menu when a relationship is clicked
    onTap();
    notifyListeners();
  }

  // map used to store parent data
  Map<String, String> parentData() {
    return {
      'username': _userNameController.text.trim(),
      'first_name': _firstNameController.text.trim(),
      'last_name': _lastNameController.text.trim(),
      'email': _emailAddressController.text.trim(),
      'role_to_ward': _selectedRelationship,
      'password': _passwordController.text.trim(),
    };
  }

  // map used to store ward data
  Map<String, String> wardData() {
    return {
      'firstname': _wardFirstNameController.text.trim(),
      'lastname': _wardLastNameController.text.trim(),
      'department': _departmentController.text.trim(),
      'reg_no': _regNoController.text.trim(),
      'email': _wardEmailAddressController.text.trim(),
    };
  }

  // method for registering users
  Future<void> registerUser() async {
    try {
      var response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/users/signup/'),
      headers: {
        'Authorization': 'Token ec6e59abd86a88a5c21362b63f2d18c5f916d0c6',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'parent': parentData(),
        'ward': wardData(),
      }),
    );

    print('Response: ${response.statusCode}');
    print('Api Response: ${response.body}');


    } on PlatformException catch (e) {
      print(e);
    } on SocketException catch (e) {
      print(e);
    }
  } 
}