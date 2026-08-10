import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/secondary_button.dart';

class TransactionSuccessfulScreen extends StatelessWidget {
  const TransactionSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.grey4
                    ),
                    child: Image.asset(
                      "close".toPng,
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              "grox-check".toPng,
              width: 120.w,
              height: 110.h,
            ),
            SizedBox(height: 16.h),
            Text(
              "Transaction Successful",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey10,
              ),
            ),
            SizedBox(height: 5.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "You've sent ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey9,
                    ),
                  ),
                  TextSpan(
                    text: "\$500 ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey9,
                    ),
                  ),
                  TextSpan(
                    text: "to ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey9,
                    ),
                  ),
                  TextSpan(
                    text: "Lara Campbell",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey9,
                    ),
                  ),
                  TextSpan(
                    text: "(@laragrox)",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey9,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              text: "See receipt",
              prefixIcon: Icons.receipt_long_outlined,
              color: AppColors.black,
              size: ButtonSize.xlarge,
              borderRadius: 16.r,
              borderColor: Colors.transparent,
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
            SecondaryButton(
              text: "Go to wallet",
              size: ButtonSize.xlarge,
              borderRadius: 16.r,
              borderColor: AppColors.grey9,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BankTransferDetailsItem extends StatelessWidget {
  const BankTransferDetailsItem({
    super.key, 
    required this.title, 
    required this.value, 
    this.isCopyable = false,
    this.valueColor = AppColors.grey9,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final bool isCopyable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey8,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: valueColor ?? AppColors.grey9,
          ),
        ),
        if(isCopyable)...[
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
            },
            child: Icon(Icons.copy, color: AppColors.grey8, size: 20.sp),
          )
        ]
      ],
    );
  }
}