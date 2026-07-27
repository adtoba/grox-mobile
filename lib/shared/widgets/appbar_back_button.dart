import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      minWidth: 40.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: AppColors.grey3,
          width: 1.w,
        )
      ),
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Image.asset(
        "back".toPng,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}