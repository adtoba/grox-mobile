import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/auth/presentation/pages/auth_scaffolding_page.dart';
import 'package:grox/features/auth/presentation/widgets/or_divider.dart';
import 'package:grox/shared/utils/validator.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/primary_textfield.dart';
import 'package:grox/shared/widgets/secondary_button.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {

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
    return AuthScaffoldingPage(
      title: "Welcome back!", 
      subtitle: "We've missed you!", 
      formHeader: "Sign in to Grox", 
      child: Column(
        children: [
          PrimaryTextField(
            label: "Email",
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: "Your email address",
            onChanged: (value) {
              setState(() {
                isEmailValid = Validator.isEmailValid(value);
              });
            },
          ),
          SizedBox(height: 16.h),
          if (showPasswordField)...[
            PrimaryTextField(
              label: "Password",
              focusNode: passwordFocusNode,
              controller: passwordController,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
              hintText: "Enter password",
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
          PrimaryButton(
            height: 52.h,
            text: "Continue", 
            color: AppColors.primary,
            textColor: AppColors.white,
            onPressed: isEmailValid ? () {
              if(showPasswordField == false) {
                setState(() {
                  showPasswordField = true;
                  passwordFocusNode.requestFocus();
                });
              } else {
                context.push(AppRoutes.dashboard);
              }
            } : null,
          ),
          SizedBox(height: 24.h),
          OrDivider(),
          SizedBox(height: 24.h),
          SecondaryButton(
            height: 56.h,
            icon: "google-icon".toPng,
            text: "Continue with Google",
            onPressed: () {},
            color: Colors.white,
            borderColor: AppColors.grey3,
            textColor: AppColors.grey10,
          ),
          SizedBox(height: 24.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have a Grox account? ",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                TextSpan(
                  text: "Create Account",
                  recognizer: TapGestureRecognizer()..onTap = () {
                    context.push(AppRoutes.createAccount);
                  },
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}