// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_colors.dart';

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

  // dispose after use
  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailAddressController.dispose();
    super.dispose();
  }


  // a key for validating the form
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  // a key for validating the form
  final _formKeyForWard = GlobalKey<FormState>();

  GlobalKey<FormState> get formKeyForWard => _formKeyForWard;

   String _selectedRelationship = '-Select-';
  String get selectedRelationship => _selectedRelationship;

  final List _relationship = [
    ['Guardian', false],
    ['Parent', false],
  ];

  List get relationship => _relationship;
  
  bool _isMenuVisible = false;
  bool get isMenuVisible => _isMenuVisible; // Initially hide the menu

  onTap() {
    _isMenuVisible = !isMenuVisible;
    notifyListeners();
  }

  void relationshipTapped(int index, VoidCallback onTap) {
    for (var i = 0; i < _relationship.length; i++) {
      _relationship[i][1] = false;
    }
      _relationship[index][1] = true;
      _selectedRelationship = _relationship[index][0];

      print(_selectedRelationship);
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
      'role_to_ward': _selectedRelationship.toLowerCase(),
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
  Future<void> registerUser({required BuildContext context}) async {
    try {
      var response = await http.post(
      Uri.parse('http://172.31.10.127:8000/api/users/signup/'),
      headers: {
        // 'Authorization': 'Token ec6e59abd86a88a5c21362b63f2d18c5f916d0c6',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'parent': parentData(),
        'ward': wardData(),
      }),
    ).timeout(const Duration(seconds: 30));

    print('Response: ${response.statusCode}');
    print('Api Response: ${response.body}');

    if (response.statusCode == 201) {
      // handle your navigation here
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(
        'Registration Successful!',
        style: TextStyle(
          fontFamily: 'Sora',
          fontSize: 12.sp,
        ),
      ),
       backgroundColor: AppColors.greenColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(
        'Please, try again!',
        style: TextStyle(
          fontFamily: 'Sora',
          fontSize: 12.sp,
        ),
      ),
       backgroundColor: AppColors.greenColor,
        ),
      );
    }

    _userNameController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailAddressController.clear();
    _selectedRelationship = '-Select-';

    notifyListeners();


    } on PlatformException catch (e) {
      print(e);
    } on SocketException catch (e) {
      print(e);
    }
  } 
}