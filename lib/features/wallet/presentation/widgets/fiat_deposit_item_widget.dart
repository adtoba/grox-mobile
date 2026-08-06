import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class FiatDepositItemWidget extends StatelessWidget {
  const FiatDepositItemWidget({
    super.key,
    required this.icon,
    required this.fiatOption,
    this.estimatedDuration,
    this.depositFee,
    this.instruction,
    this.limits,
    this.onTap,
  });

  final String? icon;
  final String fiatOption;
  final String? estimatedDuration;
  final String? depositFee;
  final String? instruction;
  final String? limits;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                        fiatOption,
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
                              depositFee ?? '',
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
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          //   decoration: BoxDecoration(
                          //     color: AppColors.poppy5,
                          //     borderRadius: BorderRadius.circular(8.r),
                          //   ),
                          //   child: Text(
                          //     depositFee ?? '',
                          //     style: TextStyle(
                          //       fontSize: 12.sp,
                          //       fontWeight: FontWeight.w400,  
                          //       color: AppColors.poppy,
                          //     ),
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              instruction ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,  
                color: AppColors.grey8,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              limits ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,  
                color: AppColors.grey8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}