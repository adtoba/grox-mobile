import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/send/presentation/pages/send_cross_border_page.dart';
import 'package:grox/features/send/presentation/pages/send_grox_wallet.dart';
import 'package:grox/shared/widgets/appbar_back_button.dart';
import 'package:grox/shared/widgets/tab_indicator_widget.dart';

class SendWalletPage extends StatefulWidget {
  const SendWalletPage({super.key});

  @override
  State<SendWalletPage> createState() => _SendWalletPageState();
}

class _SendWalletPageState extends State<SendWalletPage> {

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
          "Send Money",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "Send Money to Grox Wallet or Bank Account",
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
                      title: "Grox Wallet", 
                      isActive: currentPage == 0,
                      activeColor: AppColors.white, 
                      textColor: AppColors.grey9,
                      onTap: () => onPageChanged(0),
                    ),
                  ),
                  Expanded(
                    child: TabIndicatorWidget(
                      title: "Cross-Border Payment", 
                      isActive: currentPage == 1,
                      activeColor: AppColors.white, 
                      textColor: AppColors.grey9,
                      onTap: () => onPageChanged(1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: onPageChanged,
                children: [
                  SendGroxWalletPage(),
                  SendCrossBorderPage()
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}