import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class AmountSuggestionWidget extends StatelessWidget {
  const AmountSuggestionWidget({super.key, required this.amount, required this.currency, required this.isSelected, required this.onTap});

  final String amount;
  final String currency;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected ? AppColors.poppy5 : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.poppy3 :AppColors.grey3,
          ),
        ),
        child: Text(
          "$currency $amount",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.poppy6 : Color(0xff444444),
          ),
        ),
      ),
    );
  }
}