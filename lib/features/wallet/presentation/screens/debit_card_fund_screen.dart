import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/widgets/secured_info_widget.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/primary_textfield.dart';

class DebitCardFundScreen extends StatelessWidget {
  const DebitCardFundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card Payment",
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
          PrimaryTextField(
            label: "Cardholder Name",
            hintText: "Enter cardholder name",
          ),
          SizedBox(height: 16.h),
          PrimaryTextField(
            label: "Card Number",
            hintText: "0000 0000 0000 0000",
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  label: "Expiry",
                  hintText: "MM/YY",
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: PrimaryTextField(
                  label: "CVV",
                  hintText: "000"
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Kindly note that Grox does not store your card information.",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.error,
            ),
          ),
          SizedBox(height: 16.h),
          SecuredInfoWidget(
            title: "Payment secured", 
            value: "Your payment is protected by 256-bit SSL encryption and PCI DSS compliance.",
          ),
          SizedBox(height: 16.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Processing Fee: ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey10,
                  ),
                ),
                TextSpan(
                  text: "2.5% + \$0.14",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          PrimaryButton(
            text: "Pay \$500",
            prefixIcon: Icons.lock_outline,
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