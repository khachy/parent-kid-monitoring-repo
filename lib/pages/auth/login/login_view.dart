import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';

class LoginView extends StatelessWidget {
  final VoidCallback onTap;
  const LoginView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 182.h,
                    width: 177.w,
                  ),
                  // login text
                  const HeaderText(
                    text: 'Log in', 
                    fontSize: 24,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  // email textfield
                  const CustomTextField(
                    optionText: 'Email', 
                    hintText: 'obinnaezee@yahoo.com',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  // password textfield
                  const CustomTextField(
                    optionText: 'Password', 
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  // button
                  CustomButton(buttonText: 'Log in', onTap: () {
                    
                  },),
                  SizedBox(
                    height: 25.h,
                  ),
                  // don't have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
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
                        onTap: onTap,
                        child: Text(
                          'Sign up',
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
    );
  }
}