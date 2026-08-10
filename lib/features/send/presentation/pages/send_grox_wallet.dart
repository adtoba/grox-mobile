import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/pages/fund_wallet_fiat_page.dart';
import 'package:grox/features/wallet/presentation/widgets/amount_suggestion_widget.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/alt_dropdown_field.dart';
import 'package:grox/shared/widgets/alt_textfield.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class SendGroxWalletPage extends StatefulWidget {
  const SendGroxWalletPage({super.key});

  @override
  State<SendGroxWalletPage> createState() => _SendGroxWalletPageState();
}

class _SendGroxWalletPageState extends State<SendGroxWalletPage> {

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
      body: Column(
        children: [
          AltTextField(
            label: "Grox Username",
            hintText: "Enter username",
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
          SizedBox(height: 16.h),
          AltTextField(
            controller: amountController,
            label: "Amount",
            prefixText: "\$",
            hintText: "Enter amount",
            suffixText: "min \$1"
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
          AltTextField(
            label: "Description",
            hintText: "What's this for?",
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: PrimaryButton(
          text: "Send Money",
          color: AppColors.black,
          size: ButtonSize.xlarge,
          borderRadius: 16.r,
          borderColor: Colors.transparent,
          onPressed: () {},
        ),
      ),
    );
  }
}