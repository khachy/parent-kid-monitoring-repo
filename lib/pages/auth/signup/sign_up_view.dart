import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/complete_sign_up_view.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';
import 'package:parent_kid_monitoring_app/utils/drop_down_field.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.whiteColor,
            ),
            Expanded(
              child: SingleChildScrollView(
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
                    const CustomTextField(
                      optionText: 'Username', 
                      hintText: 'Obinna Eze',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // first name textfield
                    const CustomTextField(
                      optionText: 'First Name', 
                      hintText: 'Obinna Eze',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // last name textfield
                    const CustomTextField(
                      optionText: 'Last Name', 
                      hintText: 'Obinna Eze',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // email textfield
                    const CustomTextField(
                      optionText: 'Email', 
                      hintText: 'obinnaezee@yahoo.com',
                      obscureText: false,
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompleteSignUpView(),)),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}