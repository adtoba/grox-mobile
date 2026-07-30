import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class BuyCryptoPromoWidget extends StatelessWidget {
  const BuyCryptoPromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        // TODO: Implement buy and sell action
      },
      height: 56.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: AppColors.blue1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "usdt-usdc".toPng,
            height: 24.h,
            width: 40.w,
          ),
          SizedBox(width: 10.w),
          Text(
            "Buy & Sell your USDC/USDT",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blue7,
            ),
          )
        ],
      ),
    );
  }
}