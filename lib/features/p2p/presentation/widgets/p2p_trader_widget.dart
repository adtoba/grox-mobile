import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/widgets/tab_indicator_widget.dart';

class P2pTraderWidget extends StatelessWidget {
  P2pTraderWidget({
    super.key, 
    this.paymentMethods = const [
      "Bank Transfer",
      "Mobile Money",
    ],
    this.type = "buy",
    this.onBuy
  });

  final List<String>? paymentMethods;
  final String? type;
  final Function()? onBuy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
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
                        Expanded(
                          child: Row(
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "₦1,580",
                                style: TextStyle(
                                  fontFamily: "Geist",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey12,
                                ),
                              ),
                              TextSpan(
                                text: "/Grox",
                                style: TextStyle(
                                  fontFamily: "Geist",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey8,
                                ),
                              )
                            ],
                          ),
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
          Row(
            children: [
              Expanded(
                child: Row(
                  spacing: 8.w,
                  children: [
                    ...paymentMethods?.map((method) => TraderBadgeWidget(
                      title: method
                    )).toList() ?? [],
                  ],
                ),
              ),
              TabIndicatorWidget(
                title: type == "buy" ? "Buy Grox" : "Sell Grox", 
                isActive: true, 
                activeColor: type == "buy" ? AppColors.green7 : AppColors.poppy6, 
                textColor: AppColors.white, 
                onTap: onBuy ?? () {}
              )
            ],
          )
        ],
      ),
    );
  }
}


class TraderBadgeWidget extends StatelessWidget {
  const TraderBadgeWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey3,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.grey9,
        ),
      ),
    );
  }
}