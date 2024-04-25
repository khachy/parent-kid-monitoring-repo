import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/completeSignUp/complete_sign_up_view.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/sign_up_model.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';
import 'package:parent_kid_monitoring_app/utils/drop_down_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  final VoidCallback onTap;
  const SignUpView({super.key, required this.onTap});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {


  bool isClicked = false;

  void toggleClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              color: AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<SignUpModel>(
                builder: (context, model, child) => 
                Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 166.w,
                      ),
                      // sign up text
                      const HeaderText(
                        text: 'Sign Up', 
                        fontSize: 24,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      // username textfield
                      CustomTextField(
                        optionText: 'Username', 
                        hintText: 'Obinna Eze',
                        obscureText: false,
                        controller: model.userNameController,
                        validator: (value) {
                          if (model.userNameController.text.isEmpty && value != null) {
                            return 'Please enter a username!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // first name textfield
                      CustomTextField(
                        optionText: 'First Name', 
                        hintText: 'Obinna Eze',
                        obscureText: false,
                        controller: model.firstNameController,
                        validator: (value) {
                          if (model.firstNameController.text.isEmpty && value != null) {
                            return 'Please enter your first name!';
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
                        hintText: 'Obinna Eze',
                        obscureText: false,
                        controller: model.lastNameController,
                        validator: (value) {
                          if (model.lastNameController.text.isEmpty && value != null) {
                            return 'Please enter your last name!';
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
                        hintText: 'obinnaezee@yahoo.com',
                        obscureText: false,
                        controller: model.emailAddressController,
                        validator: (value) {
                          if (!EmailValidator.validate(model.emailAddressController.text) && value != null) {
                            return 'Please enter a valid email address!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // who are you... textfield
                      DropDownField(
                        onTap: toggleClicked,
                        isClicked: isClicked,
                      ),
                      SizedBox(
                        height: !isClicked ? 35.h : 5.h,
                      ),
                      // button
                      CustomButton(
                        buttonText: 'Continue',
                        // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompleteSignUpView(),)),
                        onTap: () {
                          if (model.formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompleteSignUpView(),));
                          } else if (model.selectedRelationship != '-Select-') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(
                                'Please select a relationship!',
                                style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 14.sp,
                                  ),
                                ),
                              backgroundColor: AppColors.redColor,
                              ),
                            );
                            return;
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
                            onTap: widget.onTap,
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
            ),
          ),
        ],
      ),
    );
  }
}