import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key, 
    required this.transactionType, 
    required this.transactionAmount, 
    required this.transactionDate
  });

  final String transactionType;
  final String transactionAmount;
  final String transactionDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: getTransactionBgColor(transactionType),
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            getIcon(transactionType),
            height: 24.h,
            width: 24.w,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionType,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey9,
                )
              ),
              Text(
                transactionDate,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                )
              )
            ],
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          transactionAmount,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey10,
          )
        )
      ],
    );
  }

  String getIcon(String transactionType) {
    switch(transactionType) {
      case "Send":
        return "send-transaction".toPng;
      case "Receive":
        return "receive-transaction".toPng;
      case "Stake":
        return "stake-transaction".toPng;
      default:
        return "send-transaction".toPng;
    }
  }

  Color getTransactionIconColor(String transactionType) {
    switch(transactionType) {
      case "Send":
        return AppColors.primary;
      case "Receive":
        return AppColors.blue;
      case "Transfer":
        return AppColors.green;
      case "Status":
        return AppColors.poppy;
      default:
        return AppColors.primary;
    }
  }

  Color getTransactionBgColor(String transactionType) {
    switch(transactionType) {
      case "Send":
        return AppColors.poppy5;
      case "Receive":
        return AppColors.blue5;
      case "Status":
        return AppColors.green5;
      default:
        return AppColors.poppy5;
    }
  }
}