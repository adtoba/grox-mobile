import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class P2pCurrencyItem extends StatelessWidget {
  const P2pCurrencyItem({super.key, required this.currency, this.isSelected = false});

  final String currency;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.poppy5 : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.poppy3 : AppColors.grey3,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        currency,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isSelected ? AppColors.poppy6 : AppColors.grey9,
        ),
      ),
    );
  }
}