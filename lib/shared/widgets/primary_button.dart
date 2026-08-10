import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/enum/button_size.dart';



class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key, 
    required this.text, 
    this.height,
    this.color = AppColors.poppy,
    this.textColor = AppColors.white,
    this.width = double.infinity,
    this.size = ButtonSize.large, 
    this.onPressed,
    this.borderColor,
    this.elevation,
    this.borderRadius,
    this.suffixIcon,
    this.prefixIcon,
  });

  final String text;
  final double width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final ButtonSize size;
  final double? elevation;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      elevation: elevation,
      height: height ?? _getButtonHeight(size),
      onPressed: onPressed,
      disabledColor: color ?? AppColors.poppy4,
      color: color ?? AppColors.poppy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
        side: BorderSide(
          color: borderColor ?? (onPressed != null ? AppColors.poppy : AppColors.poppy5),
          width: 1.w,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(prefixIcon != null)...[
            Icon(prefixIcon, size: 16.sp, color: textColor ?? AppColors.white),
            SizedBox(width: 8.w),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: _getTextSize(size),
              fontWeight: FontWeight.w400,
              color: textColor ?? AppColors.white,
            ),
          ),
          if(suffixIcon != null)...[
            SizedBox(width: 8.w),
            Icon(suffixIcon, size: 16.sp, color: textColor ?? AppColors.white),
          ],
        ],
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