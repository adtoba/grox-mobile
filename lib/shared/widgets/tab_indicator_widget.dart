import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class TabIndicatorWidget extends StatelessWidget {
  const TabIndicatorWidget({
    super.key, 
    required this.title, 
    required this.isActive, 
    required this.activeColor, 
    required this.textColor,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final Color activeColor;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32.r),
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isActive ? textColor : AppColors.grey9
          ),
        ),
      ),
    );
  }
}