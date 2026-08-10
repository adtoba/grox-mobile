import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class FundWalletNoticeWidget extends StatelessWidget {
  const FundWalletNoticeWidget({super.key, required this.title, required this.instructions});

  final String title;
  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),        
        color: Color(0xffFCF7EC)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "caution".toPng,
                width: 20.w,
                height: 20.h,
                color: Color(0xffCA7F0A),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffCA7F0A),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 0
            ),
            itemBuilder: (context, index) => Row(
              children: [
                Icon(
                  Icons.circle, 
                  color: AppColors.grey9, 
                  size: 6.sp
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    instructions[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey9,
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: instructions.length
          )
        ],
      ),
    );
  }
}