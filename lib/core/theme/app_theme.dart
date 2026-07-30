import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildTheme(
    brightness: Brightness.light, 
    background: AppColors.white, 
    onSurface: AppColors.grey10, 
    secondary: AppColors.grey2,
    text: AppColors.black,
  );


  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color background,
    required Color onSurface,
    required Color secondary,
    required Color text,
  }) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      onPrimary: AppColors.primary,
      primary: AppColors.primary,
      secondary: secondary,
      onSecondary: secondary,
      surface: background,
      onSurface: onSurface,
      error: AppColors.error,
      onError: AppColors.error,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      useMaterial3: true,
      brightness: brightness,
      fontFamily: "Geist",
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: "Geist",
          fontWeight: FontWeight.w600,
          color: AppColors.grey9,
        ),
      )
    );
  }
}