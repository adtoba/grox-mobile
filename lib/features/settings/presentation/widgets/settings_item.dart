import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key, 
    required this.title, 
    required this.icon, 
    required this.onTap,
    this.textColor
  });

  final String title;
  final String icon;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey3,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: textColor ?? AppColors.grey9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}