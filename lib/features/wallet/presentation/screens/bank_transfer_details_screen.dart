import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/widgets/fund_wallet_notice_widget.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class BankTransferDetailsScreen extends StatelessWidget {
  const BankTransferDetailsScreen({
    super.key, 
    required this.bankName, 
    required this.accountNumber, 
    required this.accountName, 
    required this.routingNumber, 
    required this.reference,
  });

  final String bankName;
  final String accountNumber;
  final String accountName;
  final String routingNumber;
  final String reference;

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
                "Bank Transfer Details",
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
                    title: "Bank Name", 
                    value: bankName
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Account Number", 
                    value: accountNumber,
                    isCopyable: true,
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Account Name", 
                    value: accountName,
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Routing Number", 
                    value: routingNumber
                  ),
                  SizedBox(height: 16.h),
                  Divider(
                    color: AppColors.grey4,
                    height: 1.h,
                  ),
                  SizedBox(height: 16.h),
                  BankTransferDetailsItem(
                    title: "Reference", 
                    value: reference,
                    isCopyable: true,
                    valueColor: AppColors.poppy,
                  ),
                ]
              ),
            ),
          ),
          SizedBox(height: 16.h),
          FundWalletNoticeWidget(
            title: "Important Instructions:", 
            instructions: [
              "Use the reference code exactly as shown above",
              "Transfers typically process within 5-15 minutes",
              "Contact support if your deposit isn't reflected within 30 minutes"
            ]
          ),
          SizedBox(height: 16.h),
          PrimaryButton(
            text: "I've sent the money",
            color: AppColors.black,
            size: ButtonSize.xlarge,
            borderRadius: 16.r,
            borderColor: Colors.transparent,
            onPressed: () {},
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