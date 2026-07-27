import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key, 
    this.label,
    this.controller,
    this.inputType,
    this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? label;
  final String? hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
        TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: widget.isPassword,
          onChanged: widget.onChanged,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey10,
            letterSpacing: 0
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
              color: AppColors.grey7
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey3
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey3
              )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey3
              )
            )
          ),
        )
      ],
    );
  }
}