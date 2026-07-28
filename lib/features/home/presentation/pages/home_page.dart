import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/home/presentation/widgets/promo_widget.dart';
import 'package:grox/features/home/presentation/widgets/quick_actions_row.dart';
import 'package:grox/features/home/presentation/widgets/recent_transactions.dart';
import 'package:grox/features/home/presentation/widgets/wallet_balance_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10.w),
        actions: [
          IconButton(
            icon: Image.asset(
              "bell-notification".toPng,
              height: 24.h,
              width: 24.w,
            ),
            onPressed: () {
              // TODO: Implement notification action
            },
          )
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage(
                "avatar".toPng
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Afternoon 😎",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Oluwatobi!",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey10,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              WalletBalanceWidget(),
              SizedBox(height: 16.h),
              QuickActionsRow(),
              SizedBox(height: 16.h),
              PromoWidget(),
              SizedBox(height: 16.h),
              MaterialButton(
                onPressed: () {
                  // TODO: Implement buy and sell action
                },
                height: 56.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: BorderSide(
                    color: AppColors.blue1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "usdt-usdc".toPng,
                      height: 24.h,
                      width: 40.w,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Buy & Sell your USDC/USDT",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue7,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              RecentTransactions(),
            ],
          ),
        ),
      )
    );
  }
}