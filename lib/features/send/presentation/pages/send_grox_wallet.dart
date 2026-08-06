import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/shared/widgets/alt_textfield.dart';

class SendGroxWalletPage extends StatefulWidget {
  const SendGroxWalletPage({super.key});

  @override
  State<SendGroxWalletPage> createState() => _SendGroxWalletPageState();
}

class _SendGroxWalletPageState extends State<SendGroxWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AltTextField(
          label: "Grox Username",
          hintText: "Enter username",
        ),
        SizedBox(height: 16.h),
        AltTextField(
          label: "Amount",
          prefixText: "\$",
          hintText: "Enter amount",
          suffixText: "min \$1"
        ),
        SizedBox(height: 16.h),
        AltTextField(
          label: "Description",
          hintText: "What's this for?",
        )
      ],
    );
  }
}