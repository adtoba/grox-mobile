import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key, this.showCloseButton = true});

  final bool? showCloseButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            Color(0xff5D1F84),
            Color(0xffD54241),
          ]
        )
      ),
      child: Row(
        children: [
          Image.asset(
            "gift".toPng,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              "Invite & Earn \$10",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          if(showCloseButton == true)
            Icon(
              Icons.close,
              color: Colors.white,
              size: 24.sp,
            )
        ],
      ),
    );
  }
}