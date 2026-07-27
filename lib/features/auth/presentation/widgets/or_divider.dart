import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.w,
            color: AppColors.grey4,
          ),
        ),
        SizedBox(width: 24.w),
        Text(
          "OR",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey8,
          ),
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: Container(
            height: 1.w,
            color: AppColors.grey4,
          ),
        ),
      ],
    );
  }
}