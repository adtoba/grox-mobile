import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/screens/bank_transfer_details_screen.dart';
import 'package:grox/features/wallet/presentation/screens/debit_card_fund_screen.dart';
import 'package:grox/features/wallet/presentation/widgets/amount_suggestion_widget.dart';
import 'package:grox/features/wallet/presentation/widgets/fiat_deposit_item_widget.dart';
import 'package:grox/features/wallet/presentation/widgets/rate_widget.dart';
import 'package:grox/shared/widgets/alt_dropdown_field.dart';
import 'package:grox/shared/widgets/alt_textfield.dart';

class FiatDepositItem {
  final String icon;
  final String fiatOption;
  final String instruction;
  final String limits;
  final String? estimatedDuration;
  final String depositFee;

  FiatDepositItem({
    required this.icon,
    required this.fiatOption,
    required this.instruction,
    required this.limits,
    this.estimatedDuration,
    required this.depositFee,
  });
}

class AmountSuggestion {
  final String amount;
  final String currency;

  AmountSuggestion({
    required this.amount,
    required this.currency,
  });
}

class FundWalletFiatPage extends StatefulWidget {
  const FundWalletFiatPage({super.key});

  @override
  State<FundWalletFiatPage> createState() => _FundWalletFiatPageState();
}

class _FundWalletFiatPageState extends State<FundWalletFiatPage> {
  List<FiatDepositItem> fiatDepositItems = [
    FiatDepositItem(
      icon: "bank-transfer-fiat".toPng,
      fiatOption: 'Bank Transfer',
      instruction: 'Direct transfer from your bank account',
      estimatedDuration: '5-10 mins',
      depositFee: 'Free',
      limits: 'Limits: \$10 - \$50,000 daily',
    ),
    FiatDepositItem(
      icon: "debit-fiat".toPng,
      fiatOption: 'Debit/Credit Card',
      instruction: 'Pay using your debit/credit cards',
      estimatedDuration: 'Instant',
      depositFee: '2.9%',
      limits: 'Limits: \$10 - \$50,000 daily',
    ),
  ];

  List<String> currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'KRW',
    'CNY',
    'INR',
  ];

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

  String? selectedCurrency;
  String? selectedAmount;

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deposit Amount",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey9,
              ),
            ),
            SizedBox(height: 16.h),
            AltDropdownField<String>(
              label: 'Currency',
              prefixText: '\$',
              hintText: 'Select currency',
              value: selectedCurrency,
              items: currencies
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedCurrency = value);
              },
            ),
            SizedBox(height: 24.h),
            AltTextField(
              controller: amountController,
              label: "Amount",
              prefixText: "\$",
              suffixText: "min: \$1",
              hintText: '500',
              onChanged: (value) {
                setState(() => selectedAmount = value);
              },
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
            SizedBox(height: 24.h),
            RateWidget(
              fromCurrency: "USD", 
              toCurrency: "GROX", 
              amountToReceive: 500, 
              rate: 1
            ),
            SizedBox(height: 24.h),
            Text(
              "Payment options",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey9,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return FiatDepositItemWidget(
                  icon: fiatDepositItems[index].icon,
                  fiatOption: fiatDepositItems[index].fiatOption,
                  instruction: fiatDepositItems[index].instruction,
                  estimatedDuration: fiatDepositItems[index].estimatedDuration,
                  depositFee: fiatDepositItems[index].depositFee,
                  limits: fiatDepositItems[index].limits,
                  onTap: () {
                    if(fiatDepositItems[index].fiatOption == 'Bank Transfer') {
                      showBankTransferDetails();
                    } else if(fiatDepositItems[index].fiatOption == 'Debit/Credit Card') {
                      showDebitCardFundScreen();
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h), 
              itemCount: fiatDepositItems.length
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }

  void showBankTransferDetails() {
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
        return BankTransferDetailsScreen(
          bankName: 'Wells Fargo',
          accountNumber: '1234567890',
          accountName: 'GroxInc/Toba',
          routingNumber: '021000021',
          reference: 'GRX-17537821312312',
        );
      }
    );
  }

  void showDebitCardFundScreen() {
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: const DebitCardFundScreen(),
        );
      }
    );
  }
}