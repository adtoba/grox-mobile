import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class SendTypeWidget extends StatelessWidget {
  const SendTypeWidget({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.image, 
    required this.type, 
    required this.isSelected,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String image; 
  final String type;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.poppy : AppColors.grey3,
            width: 1.w
          )
        ),
        child: Column(
          children: [
            Image.asset(
              image.toPng,
              height: 64.h,
              width: 64.w,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey9,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey8,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SendTypeType(
                  title: type == "self" ? "Bank Transfer" : "Grox Wallet",
                  icon: type == "self" ? "bank" : "grox-wallet",
                ),
                Text(
                  "•",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
                SendTypeType(
                  title: type == "self" ? "Crypto" : "Cross-Border",
                  icon: type == "self" ? "crypto" : "globe",
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if(isSelected)...[
              PrimaryButton(
                borderRadius: 8.r,
                text: "Continue",
                onPressed: () {}
              )
            ] else ...[
              PrimaryButton(
                borderRadius: 8.r,
                borderColor: Colors.transparent,
                text: "Continue",
                color: Colors.transparent,
                textColor: AppColors.grey1,
                onPressed: isSelected ? () {} : null,
              )
            ],
            
          ],
        ),
      ),
    );
  }
}

class SendTypeType extends StatelessWidget {
  const SendTypeType({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon.toPng,
          height: 16.h,
          width: 16.w,
        ),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey8,
          ),
        ),
      ],
    );
  }
}