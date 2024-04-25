import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text.dart';
import 'package:parent_kid_monitoring_app/pages/auth/login/login_model.dart';
import 'package:parent_kid_monitoring_app/utils/custom_button.dart';
import 'package:parent_kid_monitoring_app/utils/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final VoidCallback onTap;
  const LoginView({super.key, required this.onTap});

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
              child: Consumer<LoginModel>(
                builder: (context, model, child) => 
                Column(
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
                    CustomTextField(
                      optionText: 'Email', 
                      hintText: 'obinnaezee@yahoo.com',
                      obscureText: false,
                      controller: model.emailAddressController,
                      validator: (value) {
                        if (value != null && !EmailValidator.validate(model.emailAddressController.text)) {
                          return 'Please enter a valid email address!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    // password textfield
                    CustomTextField(
                      optionText: 'Password', 
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
          ),
        ],
      ),
    );
  }
}