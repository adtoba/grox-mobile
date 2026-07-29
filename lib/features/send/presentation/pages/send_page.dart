import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/send/presentation/widgets/send_type_widget.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {

  String? sendType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "Send Money/Withdraw",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.grey9,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Who are you sending money to?",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey9,
              ),
            ),
            Text(
              "Choose the type of transfer you'd like to make",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey8,
              ),
            ),
            SizedBox(height: 20.h),
            SendTypeWidget(
              title: "Send to Self",
              subtitle: "Withdraw funds to your bank account or crypto wallet",
              image: "send-self",
              type: "self",
              isSelected: sendType == "self",
              onPressed: () {
                setState(() {
                  sendType = "self";
                });
              },
            ),
            SizedBox(height: 20.h),
            SendTypeWidget(
              title: "Send to Others",
              subtitle: "Send money to Grox users or via cross-border payments",
              image: "send-others",
              type: "others",
              isSelected: sendType == "others",
              onPressed: () {
                setState(() {
                  sendType = "others";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}