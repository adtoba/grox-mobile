import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/pages/fund_wallet_fiat_page.dart';
import 'package:grox/features/wallet/presentation/widgets/amount_suggestion_widget.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/alt_dropdown_field.dart';
import 'package:grox/shared/widgets/alt_textfield.dart';
import 'package:grox/shared/widgets/primary_button.dart';

List<AmountSuggestion> amountSuggestions = [
  AmountSuggestion(
    amount: '50',
    currency: '\$',
  ),
  AmountSuggestion(
    amount: '100',
    currency: '\$',
  ),
  AmountSuggestion(
    amount: '500',
    currency: '\$',
  ),
  AmountSuggestion(
    amount: '1000',
    currency: '\$',
  ),
];

class CryptoTransferDetailsScreen extends StatefulWidget {
  const CryptoTransferDetailsScreen({
    super.key, 
  });

  @override
  State<CryptoTransferDetailsScreen> createState() => _CryptoTransferDetailsScreenState();
}

class _CryptoTransferDetailsScreenState extends State<CryptoTransferDetailsScreen> {

  String? selectedCurrency;
  TextEditingController amountController = TextEditingController();
  String selectedAmount = '500';

  List<String> currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'KRW',
    'CNY',
    'INR',
  ];

  bool isMoneySent = false;

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
                "Send to Crypto Wallet",
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
          Row(
            children: [
              Image.asset(
                "tether-usdt".toPng,
                width: 32.w,
                height: 32.h,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tether (USDT)",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey9,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      spacing: 8.w,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.grey4,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "TON",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,  
                              color: AppColors.grey9,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.grey4,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "~5-10 mins",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,  
                              color: AppColors.grey9,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.poppy5,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "\$2 fee",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,  
                              color: AppColors.poppy,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Deposit Amount",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey9,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: AltDropdownField<String>(
                  label: 'Currency',
                  prefixText: '\$',
                  hintText: 'Select',
                  value: selectedCurrency,
                  items: currencies
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) {
                    setState(() => selectedCurrency = value ?? '');
                  },
                ),
              ),
              SizedBox(width: 16.h),
              Expanded(
                child: AltTextField(
                  controller: amountController,
                  label: "Amount",
                  prefixText: "\$",
                  suffixText: "min: \$1",
                  hintText: '500',
                  onChanged: (value) {
                    setState(() => selectedAmount = value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            spacing: 8.w,
            children: amountSuggestions.map((suggestion) => AmountSuggestionWidget(
              amount: suggestion.amount,
              currency: suggestion.currency,
              isSelected: amountController.text == suggestion.amount,
              onTap: () {
                setState(() => selectedAmount = suggestion.amount);
                amountController.text = suggestion.amount;
              },
            )).toList(),
          ),
          SizedBox(height: 16.h),        
          Align(
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Available Balance: ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey8,
                    ),
                  ),
                  TextSpan(
                    text: "\$2,840",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Minimum Deposit: ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey8,
                    ),
                  ),
                  TextSpan(
                    text: "\$500",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey9,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AltTextField(
            controller: TextEditingController(
              text: "TAJBeXjwTQPnC3LTNgAQnBeUQ1qm65Dk1z"
            ),
            label: "Crypto Address",
            hintText: "Enter your crypto address",
            suffixIcon: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: "TAJBeXjwTQPnC3LTNgAQnBeUQ1qm65Dk1z"));
              },
              child: Icon(
                Icons.copy,
                color: AppColors.grey8,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AltTextField(
            controller: TextEditingController(
              text: "TAJBeXjwTQPnC3LTNgAQnBeUQ1qm65Dk1z"
            ),
            label: "Transaction ID",
            hintText: "Enter your transaction ID",
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isMoneySent,
                checkColor: AppColors.white,
                onChanged: (value) {
                  setState(() => isMoneySent = value ?? false);
                },
              ),
              Expanded(
                child: Text(
                  "I've sent the crypto to the address provided above",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
              ),  
            ],
          ),
          SizedBox(height: 16.h),
          PrimaryButton(
            text: "Confirm Transaction",
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