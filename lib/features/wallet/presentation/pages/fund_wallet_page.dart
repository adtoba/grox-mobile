import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/wallet/presentation/pages/fund_wallet_crypto_page.dart';
import 'package:grox/features/wallet/presentation/pages/fund_wallet_fiat_page.dart';
import 'package:grox/shared/widgets/appbar_back_button.dart';
import 'package:grox/shared/widgets/tab_indicator_widget.dart';

class FundWalletPage extends StatefulWidget {
  const FundWalletPage({super.key});

  @override
  State<FundWalletPage> createState() => _FundWalletPageState();
}

class _FundWalletPageState extends State<FundWalletPage> {

  final pageController = PageController(
    keepPage: true,
    initialPage: 0
  );

  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });

    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppbarBackButton(),
        title: Text(
          "Fund Wallet",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "Add Money to your Grox Wallet",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff868686),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
              decoration: BoxDecoration(
                color: AppColors.grey5,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TabIndicatorWidget(
                      title: "Fiat Deposit", 
                      isActive: currentPage == 0,
                      activeColor: AppColors.white, 
                      textColor: AppColors.grey9,
                      onTap: () => onPageChanged(0),
                    ),
                  ),
                  Expanded(
                    child: TabIndicatorWidget(
                      title: "Crypto Deposit", 
                      isActive: currentPage == 1,
                      activeColor: AppColors.white, 
                      textColor: AppColors.grey9,
                      onTap: () => onPageChanged(1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: onPageChanged,
                children: [
                  const FundWalletFiatPage(),
                  const FundWalletCryptoPage(),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}