import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/constants/header_text_tiny.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/sign_up_model.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';
import 'package:provider/provider.dart';

class CompleteSignUpView extends StatefulWidget {
  const CompleteSignUpView({super.key});

  @override
  State<CompleteSignUpView> createState() => _CompleteSignUpViewState();
}

class _CompleteSignUpViewState extends State<CompleteSignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SignUpModel>(
          builder: (context, model, child) => Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                          horizontal: 20.w
                        ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded, size: 24,
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: model.formKeyForWard,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // complete sign up text
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w
                          ),
                          child: const HeaderText(
                            text: 'Complete Sign Up', 
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        // fill in the details...text
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w
                          ),
                          child: const HeaderTextTiny(
                            text: 'Fill in details about your ward', 
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // first name textfield
                        CustomTextField(
                        optionText: 'First Name', 
                        hintText: 'First name of your ward',
                        obscureText: false,
                        controller: model.wardFirstNameController,
                        validator: (value) {
                          if (value != null && model.wardFirstNameController.text.isEmpty) {
                            return 'Please enter your ward\'s first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // last name textfield
                      CustomTextField(
                        optionText: 'Last Name', 
                        hintText: 'Last name of your ward',
                        obscureText: false,
                        controller: model.wardLastNameController,
                        validator: (value) {
                          if (value != null && model.wardLastNameController.text.isEmpty) {
                            return 'Please enter your ward\'s last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // Department textfield
                      CustomTextField(
                        optionText: 'Department', 
                        hintText: 'Department of your ward',
                        obscureText: false,
                        controller: model.departmentController,
                        validator: (value) {
                          if (value != null && model.departmentController.text.isEmpty) {
                            return 'Please enter your ward\'s department';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // reg no text
                      CustomTextField(
                        optionText: 'Registration Number', 
                        hintText: 'Registration number of your ward',
                        obscureText: false,
                        controller: model.regNoController,
                        validator: (value) {
                          if (value != null && model.regNoController.text.isEmpty) {
                            return 'Please enter your ward\'s registration number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // email textfield
                      CustomTextField(
                        optionText: 'Email', 
                        hintText: 'Email address of your ward',
                        obscureText: false,
                        controller: model.wardEmailAddressController,
                        validator: (value) {
                          if (value != null && !EmailValidator.validate(model.wardEmailAddressController.text)) {
                            return 'Please enter your ward\'s email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // create password
                      CustomTextField(
                        optionText: 'Create Password', 
                        hintText: 'Enter your password',
                        obscureText: true,
                        controller: model.passwordController,
                        validator: (value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value != null && !regex.hasMatch(model.passwordController.text)) {
                            return 'Password should contain at least: \nOne upper case\nOne lower case\nOne digit\nOne special character\n8 characters in length';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      // button
                      CustomButton(
                        buttonText: 'Sign Up', 
                        onTap: () async {
                          if (model.formKeyForWard.currentState!.validate()) {
                            setState(() {
                             Provider.of<SignUpModel>(context, listen: false).registerUser();
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      // already have an account text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: AppColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}