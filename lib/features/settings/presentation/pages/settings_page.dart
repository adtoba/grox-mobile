import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/home/presentation/widgets/buy_crypto_promo_widget.dart';
import 'package:grox/features/home/presentation/widgets/promo_widget.dart';
import 'package:grox/features/settings/presentation/widgets/settings_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                "avatar".toPng
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Julius A. Asaolu",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey10,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "@tobi-grox",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            PromoWidget(
              showCloseButton: false,
            ),
            SizedBox(height: 12.h),
            BuyCryptoPromoWidget(),
            SizedBox(height: 32.h),
            Text(
              "Profile & Settings",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey9
              ),
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Profile Information",
              icon: "profile-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Security",
              icon: "security-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Notifications",
              icon: "bell-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Manage Bank Accounts",
              icon: "manage-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Payment Information",
              icon: "payment-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Language",
              icon: "language-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Help & Support",
              icon: "help-settings".toPng,
              onTap: () {},
            ),
            SizedBox(height: 12.h),
            SettingsItem(
              title: "Log Out",
              icon: "logout".toPng,
              textColor: AppColors.poppy,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}