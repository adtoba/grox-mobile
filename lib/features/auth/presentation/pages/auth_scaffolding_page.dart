import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class AuthScaffoldingPage extends ConsumerStatefulWidget {
  const AuthScaffoldingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formHeader,
    required this.child,
  });

  final String title;
  final String subtitle;
  final String formHeader;
  final Widget child;

  @override
  ConsumerState<AuthScaffoldingPage> createState() => _AuthScaffoldingPageState();
}

class _AuthScaffoldingPageState extends ConsumerState<AuthScaffoldingPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isEmailValid = false;
  bool showPasswordField = false;

  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff5D1F84),
              Color(0xffD54241)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppBar().preferredSize.height.h + 10.h),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  )
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "grox-red".toPng,
                        height: 42.h,
                        width: 48.w,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        widget.formHeader,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      widget.child
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}