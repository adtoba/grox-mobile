import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class CryptoDepositItemWidget extends StatelessWidget {
  const CryptoDepositItemWidget({
    super.key,
    required this.icon,
    required this.walletCrypto,
    this.walletNetwork,
    this.estimatedDuration,
    this.depositFee,
    this.minDeposit,
    this.onTap,
  });

  final String? icon;
  final String walletCrypto;
  final String? walletNetwork;
  final String? estimatedDuration;
  final String? depositFee;
  final String? minDeposit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.grey3,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon ?? '',
              width: 32.w,
              height: 32.h,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    walletCrypto,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey9,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    spacing: 8.w,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.grey4,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          walletNetwork ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,  
                            color: AppColors.grey9,
                          ),
                        ),
                      ),
                      if(estimatedDuration != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.grey4,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            estimatedDuration ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,  
                              color: AppColors.grey9,
                            ),
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.poppy5,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          depositFee ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,  
                            color: AppColors.poppy,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Miniumn:",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,  
                    color: AppColors.grey8,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  minDeposit ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,  
                    color: AppColors.grey9,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}