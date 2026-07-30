import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({super.key});

  static double get size => 40.w;

  @override
  Widget build(BuildContext context) {
    // AppBar gives the leading a tight width; Align lets the
    // button keep its intrinsic size instead of stretching.
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            borderRadius: BorderRadius.circular(8.r),
            child: Ink(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.grey3,
                  width: 1.w,
                ),
              ),
              child: Center(
                child: Image.asset(
                  "arrow_left".toPng,
                  width: 16.w,
                  height: 16.h,
                  color: AppColors.grey9,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
