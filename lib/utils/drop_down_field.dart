import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_kid_monitoring_app/constants/app_colors.dart';
import 'package:parent_kid_monitoring_app/constants/header_text_tiny.dart';

class DropDownField extends StatefulWidget {
  final VoidCallback onTap;
  final bool isClicked;
  const DropDownField({Key? key, required this.onTap, required this.isClicked})
      : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  List relationship = [
    ['Parent', false],
    ['Guardian', false]
  ];

  String selectedRelationship = '-Select-';
  bool isMenuVisible = false; // Initially hide the menu

  void relationshipTapped(int index) {
    for (var i = 0; i < relationship.length; i++) {
      relationship[i][1] = false;
    }
    setState(() {
      relationship[index][1] = true;
      selectedRelationship = relationship[index][0];
      isMenuVisible = false; // Hide the menu when a relationship is clicked
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
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
                  selectedRelationship,
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.hintTextColor.withOpacity(0.25),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMenuVisible = !isMenuVisible; // Toggle menu visibility
                    });
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
            visible: isMenuVisible, // Show/hide the menu based on isMenuVisible
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldFilled.withOpacity(0.46),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 7.w, vertical: 4.h).copyWith(bottom: 12.h),
                height: 48.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: relationship.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: GestureDetector(
                        onTap: () {
                          relationshipTapped(index);
                        },
                        child: Text(
                          relationship[index][0],
                          style: TextStyle(
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: relationship[index][1]
                                ? AppColors.buttonColor
                                : AppColors.hintTextColor.withOpacity(0.46),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
