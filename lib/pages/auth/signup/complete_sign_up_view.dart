import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/constants/header_text_tiny.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';

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
        child: Column(
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
                    const CustomTextField(
                    optionText: 'First Name', 
                    hintText: 'First name of your ward',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // last name textfield
                  const CustomTextField(
                    optionText: 'Last Name', 
                    hintText: 'Last name of your ward',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Department textfield
                  const CustomTextField(
                    optionText: 'Department', 
                    hintText: 'Department of your ward',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // reg no text
                  const CustomTextField(
                    optionText: 'Registration Number', 
                    hintText: 'Registration number of your ward',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // email textfield
                  const CustomTextField(
                    optionText: 'Email', 
                    hintText: 'Email address of your ward',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // create password
                  const CustomTextField(
                    optionText: 'Create Password', 
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  // button
                  CustomButton(
                    buttonText: 'Sign Up', 
                    onTap: (){},
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
            )
          ],
        ),
      ),
    );
  }
}