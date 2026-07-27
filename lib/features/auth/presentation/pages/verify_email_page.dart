import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/shared/enum/button_size.dart';
import 'package:grox/shared/widgets/app_scaffold.dart';
import 'package:grox/shared/widgets/pin_code_input.dart';
import 'package:grox/shared/widgets/primary_appbar.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: "verify_bg_image",
      appBar: PrimaryAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verify your email",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        "Enter the One-Time Passcode sent to ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey10,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "adetoba53@gmail.com",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey10,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: PinCodeInput(
                          length: 6,
                          onChanged: (value) {
                            // todo
                          },
                        ),
                      ),
                      SizedBox(height: 32.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Resend code in ",
                              style: TextStyle(
                                fontFamily: "Geist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey9,
                              ),
                            ),
                            TextSpan(
                              text: "42",
                              style: TextStyle(
                                fontFamily: "Geist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: " secs",
                              style: TextStyle(
                                fontFamily: "Geist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey9,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PrimaryButton(
                size: ButtonSize.large,
                text: "Submit",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
