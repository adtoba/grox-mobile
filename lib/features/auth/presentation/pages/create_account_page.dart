import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/auth/presentation/pages/auth_scaffolding_page.dart';
import 'package:grox/features/auth/presentation/widgets/or_divider.dart';
import 'package:grox/shared/utils/validator.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/primary_textfield.dart';
import 'package:grox/shared/widgets/secondary_button.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isEmailValid = false;
  bool showPasswordField = false;

  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AuthScaffoldingPage(
      title: "Look who we have here!", 
      subtitle: "Glad to see you join the movement", 
      formHeader: "Create your Grox Account", 
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
              hintText: "Create your password",
            ),
            SizedBox(height: 16.h),
          ],
          PrimaryButton(
            height: 52.h,
            text: "Continue", 
            textColor: AppColors.white,
            onPressed: isEmailValid ? () {
              if(showPasswordField == false) {
                setState(() {
                  showPasswordField = true;
                  passwordFocusNode.requestFocus();
                });
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
                  text: "Already have a Grox account? ",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                TextSpan(
                  text: "Log In",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By creating an account, you agree to Grox's",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                TextSpan(
                  text: " Terms of Service",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "Geist",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(
                    fontFamily: "Geist",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "Geist",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
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