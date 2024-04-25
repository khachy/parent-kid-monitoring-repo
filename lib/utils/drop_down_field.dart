import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text_tiny.dart';
import 'package:parent_kid_monitoring_app/pages/auth/signup/sign_up_model.dart';
import 'package:provider/provider.dart';

class DropDownField extends StatefulWidget {
  final VoidCallback onTap;
  final bool isClicked;
  const DropDownField({super.key, required this.onTap, required this.isClicked});

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Consumer<SignUpModel>(
        builder: (context, model, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTextTiny(
              text: 'Who are you to the student?',
              fontSize: 14,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              height: 48.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.textFieldFilled.withOpacity(0.26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.selectedRelationship,
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.hintTextColor.withOpacity(0.25),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        model.onTap(); // Toggle menu visibility
                      widget.onTap(); // Call the onTap callback
                    },
                    child: Icon(
                      widget.isClicked
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 25,
                      color: AppColors.hintTextColor.withOpacity(0.25),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Visibility(
              visible: model.isMenuVisible, // Show/hide the menu based on isMenuVisible
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldFilled.withOpacity(0.46),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                height: 48.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: model.relationship.length,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Provider.of<SignUpModel>(context, listen: false).relationshipTapped(index, widget.onTap);
                        },
                        child: Text(
                          model.relationship[index][0],
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: model.relationship[index][1]
                                ? AppColors.buttonColor
                                : AppColors.hintTextColor.withOpacity(0.46),
                          ),
                        ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
