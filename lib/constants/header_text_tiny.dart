import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';

class HeaderTextTiny extends StatelessWidget {
  final String text;
  final int fontSize;
  const HeaderTextTiny({
    super.key, 
    required this.text, 
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sora',
        fontWeight: FontWeight.w300,
        fontSize: fontSize.sp,
        color: AppColors.blackColor.withOpacity(0.8),
      ),
    );
  }
}