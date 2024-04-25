import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text_tiny.dart';

class CustomTextField extends StatelessWidget {
  final String optionText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomTextField({
    super.key, 
    required this.optionText, 
    required this.hintText, 
    required this.obscureText,
    required this.validator, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTextTiny(
            text: optionText, 
            fontSize: 14,
          ),
          SizedBox(
            height: 4.h,
          ),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontFamily: 'Sora',
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              color: AppColors.textFieldTextColor,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 17.h,
                horizontal: 18.w,
              ),
              filled: true,
              fillColor: AppColors.textFieldFilled.withOpacity(0.26),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldFilled,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              errorStyle: TextStyle(
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.hintTextColor.withOpacity(0.25),
              ),
            ),
            obscureText: obscureText,
            validator: validator,
          ),
        ],
      ),
    );
  }
}