import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/enum/button_size.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key, 
    required this.text, 
    this.height,
    this.color = AppColors.offWhite,
    this.textColor = AppColors.black,
    this.borderColor = AppColors.grey3,
    this.width = double.infinity,
    this.size = ButtonSize.large, 
    this.icon,
    this.iconHeight,
    this.iconWidth,
    this.borderRadius,
    required this.onPressed
  });

  final String text;
  final double width;
  final double? height;
  final String? icon;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final ButtonSize size;
  final double? iconHeight;
  final double? iconWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32.r),
        child: Container(
          width: width,
          height: height ?? _getButtonHeight(size),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Color(0xff101828).withValues(alpha: 0.05),
              )
            ],
            color: color ?? AppColors.offWhite,
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
            border: Border.all(
              color: borderColor ?? AppColors.grey3,
              width: 1.w,
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)...[
                Image.asset(
                  icon!,
                  width: iconWidth ?? 24.w,
                  height: iconHeight ?? 24.h,
                ),
                SizedBox(width: 12.w),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: _getTextSize(size),
                  fontWeight: FontWeight.w400,
                  color: textColor ?? AppColors.black,
                ),
              ),
            ],
          )
        ),
      ),
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