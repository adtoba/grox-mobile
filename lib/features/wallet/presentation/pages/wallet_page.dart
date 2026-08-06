import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/home/presentation/widgets/recent_transactions.dart';
import 'package:grox/features/wallet/presentation/widgets/quick_wallet_action_item.dart';
import 'package:grox/features/wallet/presentation/widgets/wallet_balance_item.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/secondary_button.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  List<Map<String, dynamic>> walletBalances = [
    {
      "country": "nigeria",
      "balance": "₦47,500,000.00",
    },
    {
      "country": "usa",
      "balance": "\$30,600.00",
    },
    {
      "country": "uk",
      "balance": "£24,500.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet Balance",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "12,500.00 GROX",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey10,
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 24.sp,
                      color: AppColors.grey9,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Image.asset(
              "qrcode".toPng,
              height: 32.h,
              width: 32.w,
            )
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Other Wallets",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SecondaryButton(
                    icon: "add".toPng,
                    iconHeight: 16.h,
                    iconWidth: 16.w,
                    width: 115.w,
                    size: ButtonSize.small,
                    text: "Add New", 
                    onPressed: () {

                    }
                  )
                ]
              ),
              SizedBox(height: 20.h),
              WalletBalanceRow(
                wallets: walletBalances
              ),
              SizedBox(height: 20.h),
              WalletQuickActionsRow(),
              SizedBox(height: 5.h),
              RecentTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletBalanceRow extends StatelessWidget {
  const WalletBalanceRow({super.key, required this.wallets});

  final List<Map<String, dynamic>> wallets;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10.w,
        children: [
          ...wallets.map((wallet) => WalletBalanceItem(
            country: wallet["country"],
            balance: wallet["balance"],
          )),
        ].toList(),
      ),
    );
  }
}

class WalletQuickActionsRow extends StatelessWidget {
  const WalletQuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: QuickWalletActionItem(
                title: "Fund Wallet", 
                icon: "receive-transaction", 
                onTap: () {
                  context.push(AppRoutes.fundWallet);
                }
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: QuickWalletActionItem(
              title: "Send / Withdraw", 
                icon: "withdraw", 
                onTap: () {
                  context.push(AppRoutes.sendWallet);
                }
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: QuickWalletActionItem(
                title: "Stake Grox", 
                icon: "stake", 
                onTap: () {}
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: QuickWalletActionItem(
                title: "Convert / Swap", 
                icon: "convert", 
                onTap: () {}
              ),
            ),
          ],
        ),
      ],
    );
  }
}