import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class WalletBalanceItem extends StatelessWidget {
  const WalletBalanceItem({super.key, required this.country, required this.balance});

  final String country;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey3,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            country.toPng,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(height: 12.h),
          Text(
            balance,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.grey9,
            ),
          ),
        ],
      ),
    );
  }
}