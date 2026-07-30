import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/p2p/presentation/widgets/p2p_currency_item.dart';
import 'package:grox/features/p2p/presentation/widgets/p2p_trader_widget.dart';

const List<String> currencies = [
  "All",
  "NGN",
  "USD",
  "EUR",
  "GBP",
  "CAD",
  "AUD",
  "NZD",
  "CHF",
  "JPY",
  "KRW",
];

class P2PSellPage extends StatefulWidget {
  const P2PSellPage({super.key});

  @override
  State<P2PSellPage> createState() => _P2PSellPagetate();
}

class _P2PSellPagetate extends State<P2PSellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.h);
              },
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return P2pCurrencyItem(
                  currency: currencies[index],
                  isSelected: index == 1,
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "Verified Traders Only",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Switch.adaptive(
                          value: true, 
                          activeTrackColor: AppColors.green7,
                          activeThumbColor: AppColors.white,
                          onChanged: (value) {}
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemBuilder: (context, index) {
                      return P2pTraderWidget(
                        type: "sell",
                        onBuy: () {
                          context.push(
                            AppRoutes.p2pTradeDetails,
                            extra: 'sell',
                          );
                        }
                      );
                    }, 
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 40.h);
                    }, 
                    itemCount: 6,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}