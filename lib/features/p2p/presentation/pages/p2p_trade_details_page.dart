import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/p2p/presentation/widgets/p2p_trader_widget.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/appbar_back_button.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class P2pTradeDetailsPage extends StatefulWidget {
  const P2pTradeDetailsPage({super.key, this.tradeType = "buy"});

  final String? tradeType;

  @override
  State<P2pTradeDetailsPage> createState() => _P2pTradeDetailsPageState();
}

class _P2pTradeDetailsPageState extends State<P2pTradeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;
    final bottomSpacing = bottomInset > 0 ? bottomInset : 10.h;

    return Scaffold(
      appBar: AppBar(
        leading: AppbarBackButton(),
        title: Text(
          "Trade Details"
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            TraderDetailsHeader(),
            SizedBox(height: 16.h),
            Text(
              "Trade Information",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey12,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  "Limit Per Trade",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    "₦500,000 - ₦5,620,000",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey10,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  "Payment Methods",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TraderBadgeWidget(
                        title: "Bank Transfer",
                      ),
                      SizedBox(width: 8.w),
                      TraderBadgeWidget(
                        title: "Mobile Money",
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  "Trade Window",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    "~30 Minutes",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey10,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            SecureEscrowInfoWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: bottomSpacing),
        child: PrimaryButton(
          text: widget.tradeType == "buy" ? "Proceed to Buy Grox" : "Proceed to Sell Grox",
          size: ButtonSize.large,
          borderColor: Colors.transparent,
          color: widget.tradeType == "buy" ? AppColors.green8 : AppColors.poppy,
          onPressed: () {},
        ),
      ),
    );
  }
}



class TraderDetailsHeader extends StatelessWidget {
  const TraderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey5,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "trader-sample-image".toPng,
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "MaradonaTradez",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey12,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.verified,
                          color: AppColors.blue6,
                          size: 20.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      spacing: 8.w,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "star".toPng,
                          width: 19.w,
                          height: 19.h,
                        ),
                        Text(
                          "4.9",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey10,
                          ),
                        ),
                        Text(
                          "•",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey12,
                          ),
                        ),
                        Text(
                          "1246 Trades",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey8,
                          ),
                        ),
                        Text(
                          "•",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey12,
                          ),
                        ),
                        Text(
                          "99% success rate",
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey8,
                          ),
                        ),
                      ],
                    )
                  ]
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.grey5,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "₦1,580",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey12,
                        ),
                      ),
                      Text(
                        "Price per Grox",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey8,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "23m",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey12,
                        ),
                      ),
                      Text(
                        "Avg Response Time",
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey8,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SecureEscrowInfoWidget extends StatelessWidget {
  const SecureEscrowInfoWidget({super.key, this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffF6FBFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            spacing: 8.w,
            children: [
              Image.asset(
                "escrow".toPng,
                width: 24.w,
                height: 24.h,
              ),
              Text(
                title ?? "Secure Escrow Protection",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue7,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle ?? "Grox tokens will be safely held in escrow until payment is confirmed.",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blue6,
            ),
          ),
        ],
      ),
    );
  }
}