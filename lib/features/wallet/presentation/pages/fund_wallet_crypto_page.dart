import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/screens/cryto_transfer_details_screen.dart';
import 'package:grox/features/wallet/presentation/widgets/crypto_deposit_item.dart';
import 'package:grox/features/wallet/presentation/widgets/fund_wallet_notice_widget.dart';

class CryptoDepositItem {
  final String icon;
  final String walletCrypto;
  final String walletNetwork;
  final String? estimatedDuration;
  final String depositFee;
  final String minDeposit;

  CryptoDepositItem({
    required this.icon,
    required this.walletCrypto,
    required this.walletNetwork,
    this.estimatedDuration,
    required this.depositFee,
    required this.minDeposit,
  });
}

class FundWalletCryptoPage extends StatefulWidget {
  const FundWalletCryptoPage({super.key});

  @override
  State<FundWalletCryptoPage> createState() => _FundWalletCryptoPageState();
}

class _FundWalletCryptoPageState extends State<FundWalletCryptoPage> {
  List<CryptoDepositItem> cryptoDepositItems = [
    CryptoDepositItem(
      icon: "tether-usdt".toPng,
      walletCrypto: 'Tether (USDT)',
      walletNetwork: 'TON',
      estimatedDuration: '~5-10 mins',
      depositFee: '\$2 fee',
      minDeposit: '\$200',
    ),
    CryptoDepositItem(
      icon: "tether-usdt-bep20".toPng,
      walletCrypto: 'Tether (USDT)',
      walletNetwork: 'BEP20',
      estimatedDuration: '~3-5 mins',
      depositFee: '\$4 fee',
      minDeposit: '\$400',
    ),
    CryptoDepositItem(
      icon: "usdc".toPng,
      walletCrypto: 'USDC',
      walletNetwork: 'ERC-20',
      depositFee: '\$2 fee',
      minDeposit: '\$250',
    ),
  ];

  List<String> noticeInstructions = [
    "Only send the specified cryptocurrency to the matching network address provided.",
    "Sending other cryptocurrencies or using wrong networks will result in permanent loss",
    "Minimum deposit: \$10 or equivalent - Maximum: \$50,000 daily",
    "Contact support if your deposit isn't reflected within the expected time"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Cryptocurrency",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey9,
              ),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CryptoDepositItemWidget(
                  icon: cryptoDepositItems[index].icon,
                  walletCrypto: cryptoDepositItems[index].walletCrypto,
                  walletNetwork: cryptoDepositItems[index].walletNetwork,
                  estimatedDuration: cryptoDepositItems[index].estimatedDuration,
                  depositFee: cryptoDepositItems[index].depositFee,
                  minDeposit: cryptoDepositItems[index].minDeposit,
                  onTap: () {
                    showCryptoTransferDetails();
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h), 
              itemCount: cryptoDepositItems.length
            ),
            SizedBox(height: 16.h),
            FundWalletNoticeWidget(
              title: "Important Security Notice:",
              instructions: noticeInstructions,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  void showCryptoTransferDetails() {
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
        return CryptoTransferDetailsScreen();
      }
    );
  }
}