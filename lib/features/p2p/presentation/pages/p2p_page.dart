import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/p2p/presentation/pages/p2p_buy_page.dart';
import 'package:grox/features/p2p/presentation/pages/p2p_sell_page.dart';
import 'package:grox/shared/widgets/tab_indicator_widget.dart';

class P2PPage extends StatefulWidget {
  const P2PPage({super.key});

  @override
  State<P2PPage> createState() => _P2PPageState();
}

class _P2PPageState extends State<P2PPage> {

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
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "P2P Marketplace",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey9,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Trade Grox directly with other users",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey8,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 72.h), 
          child: Container(
            height: 52.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey2,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabIndicatorWidget(
                    title: "Buy Grox", 
                    isActive: currentPage == 0,
                    activeColor: AppColors.green7, 
                    textColor: AppColors.white,
                    onTap: () => onPageChanged(0),
                  ),
                ),
                Expanded(
                  child: TabIndicatorWidget(
                    title: "Sell Grox", 
                    isActive: currentPage == 1,
                    activeColor: AppColors.poppy6, 
                    textColor: AppColors.white,
                    onTap: () => onPageChanged(1),
                  ),
                )
              ],
            ),
          )
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          P2PBuyPage(),
          P2PSellPage(),
        ],
      ),
    );
  }
}