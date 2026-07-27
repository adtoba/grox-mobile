import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/enum/button_size.dart';



class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, 
    required this.text, 
    this.color = AppColors.poppy,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    this.size = ButtonSize.large, 
    required this.onPressed
  });

  final String text;
  final double width;
  final Color? color;
  final Color? textColor;
  final ButtonSize size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: _getButtonHeight(size),
      onPressed: onPressed,
      color: color ?? AppColors.poppy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.r),
        side: BorderSide(
          color: AppColors.poppy,
          width: 1.w,
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: _getTextSize(size),
          fontWeight: FontWeight.w400,
          color: textColor ?? AppColors.white,
        ),
      )
    );
  }

  double _getButtonHeight(ButtonSize size ) {
    switch (size) {
      case ButtonSize.small:
        return 36.h;
      case ButtonSize.medium:
        return 44.h;
      case ButtonSize.large:
        return 46.h;
      case ButtonSize.xlarge:
        return 54.h;
    }
  }

  double _getTextSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.small:
        return 14.sp;
      case ButtonSize.medium:
        return 14.sp;
      case ButtonSize.large:
        return 16.sp;
      case ButtonSize.xlarge:
        return 16.sp;
    }
  }
}