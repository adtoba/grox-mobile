import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class RateWidget extends StatelessWidget {
  final String fromCurrency;
  final String toCurrency;
  final double rate; // 1 fromCurrency = rate toCurrency
  final double amountToReceive; // in toCurrency
  const RateWidget({
    super.key, 
    required this.fromCurrency, 
    required this.toCurrency, 
    required this.amountToReceive,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffF6FBFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "1 $fromCurrency = $rate $toCurrency",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blue7,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "You'll receive:",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue8,
                  ),
                ),
                TextSpan(
                  text: " $amountToReceive $toCurrency", 
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blue7,
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}