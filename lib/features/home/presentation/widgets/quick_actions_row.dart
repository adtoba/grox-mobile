import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/core/theme/app_colors.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionItem(
            title: "Fund", 
            icon: "fund", 
            onTap: () {
              context.push(AppRoutes.fundWallet);
            }
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: QuickActionItem(
            title: "Send", 
            icon: "send-icon", 
            onTap: () {}
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: QuickActionItem(
            title: "P2P", 
            icon: "p2p-icon", 
            onTap: () {}
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: QuickActionItem(
            title: "Stake", 
            icon: "stake-icon", 
            onTap: () {}
          ),
        )
      ],
    );
  }
}

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({
    super.key, 
    required this.title, 
    required this.icon, 
    required this.onTap
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 81.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.grey4,
          )
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon.toPng,
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}