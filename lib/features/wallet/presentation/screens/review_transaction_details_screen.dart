import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/screens/transaction_successful_screen.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class ReviewTransactionDetailsScreen extends StatelessWidget {
  const ReviewTransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Review Transaction",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
          SizedBox(height: 16.h),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [6, 6],
              radius: Radius.circular(8.r),
              color: AppColors.grey3,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  BankTransferDetailsItem(
                    title: "To", 
                    value: "@laragrox - Lara Campbell"
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Amount", 
                    value: "\$500",
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Fee", 
                    value: "Free",
                    valueColor: AppColors.green6,
                  ),
                  SizedBox(height: 16.h),
                  Divider(
                    color: AppColors.grey4,
                    height: 1.h,
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Total", 
                    value: "\$500",
                  ),
                ]
              ),
            ),
          ),
          // TODO: Add pin code input here
          SizedBox(height: 16.h),
          PrimaryButton(
            text: "Confirm Transaction",
            color: AppColors.black,
            size: ButtonSize.xlarge,
            borderRadius: 16.r,
            borderColor: Colors.transparent,
            onPressed: () {
              context.pop();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, 
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r)
                  ),
                ),
                builder: (context) {
                  return TransactionSuccessfulScreen();
                }
              );
            },
          ),
          SizedBox(height: 16.h),
        ],
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