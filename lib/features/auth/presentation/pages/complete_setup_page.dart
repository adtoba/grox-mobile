import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/auth/presentation/widgets/setup_stepper.dart';
import 'package:grox/shared/widgets/app_scaffold.dart';
import 'package:grox/shared/widgets/primary_appbar.dart';
import 'package:grox/shared/widgets/primary_button.dart';

class CompleteSetupPage extends ConsumerStatefulWidget {
  const CompleteSetupPage({super.key});

  @override
  ConsumerState<CompleteSetupPage> createState() => _CompleteSetupPageState();
}

class _CompleteSetupPageState extends ConsumerState<CompleteSetupPage> {
  static const _steps = [
    SetupStep(
      title: 'Create Account',
      description: 'Join Grox by creating an account',
    ),
    SetupStep(
      title: 'Verify phone number',
      description:
          'Add an extra layer of security by verifying your phone number.',
    ),
    SetupStep(
      title: 'Verify identity',
      description:
          'Upload and verify your government-issued identity credentials e.g. NIN, BVN, Int’l Passport',
    ),
    SetupStep(
      title: 'Upload Selfie',
      description:
          'Complete the verification process by taking your picture in real time.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: 'page_bg',
      appBar: const PrimaryAppBar(
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'grox-red'.toPng,
                          width: 48.w,
                          height: 42.h,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "You're almost set up",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'In line with regulations, we have to collect and verify your information',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey9,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        const SetupStepper(
                          currentStep: 2,
                          steps: _steps,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PrimaryButton(
                text: 'Submit Documents',
                height: 52.h,
                onPressed: () {
                  
                },
              ),
              SizedBox(height: 16.h),
              PrimaryButton(
                elevation: 0,
                borderColor: AppColors.offWhite,
                text: 'Verify later',
                height: 52.h,
                color: AppColors.offWhite,
                textColor: AppColors.black,
                onPressed: () {
                  
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
