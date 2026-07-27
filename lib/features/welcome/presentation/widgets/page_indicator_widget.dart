import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.currentPage, required this.totalPages});

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          for (int i = 0; i < totalPages; i++)
            Expanded(
              child: Container(
                height: 4.h,
                margin: EdgeInsets.only(right: i < totalPages - 1 ? 4.w : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56.r),
                  color: i <= currentPage
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: .2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}