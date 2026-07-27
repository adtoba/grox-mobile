import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/shared/widgets/app_scaffold.dart';
import 'package:grox/shared/widgets/primary_appbar.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/primary_textfield.dart';

class IntroductionPage extends ConsumerStatefulWidget {
  const IntroductionPage({super.key});

  @override
  ConsumerState<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends ConsumerState<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: "page_bg",
      appBar: PrimaryAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "grox-red".toPng,
                    width: 48.w,
                    height: 42.h,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Let's get to know you",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  PrimaryTextField(
                    label: "First name",
                    hintText: "First name",
                  ),
                  SizedBox(height: 8.h),
                  PrimaryTextField(
                    label: "Last name",
                    hintText: "Last name",
                  ),
                  SizedBox(height: 8.h),
                  PrimaryTextField(
                    label: "Phone number",
                    hintText: "Phone number",
                  ),
                  SizedBox(height: 8.h),
                  PrimaryTextField(
                    label: "Nationality",
                    hintText: "Select",
                  ),
                  SizedBox(height: 8.h),
                  PrimaryTextField(
                    label: "Referral code (optional)",
                    hintText: "Enter referral code",
                  ),
                  SizedBox(height: 32.h),
                  PrimaryButton(
                    text: "Continue",
                    height: 52.h,
                    onPressed: () {
                      context.push(AppRoutes.verifyPhone);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}