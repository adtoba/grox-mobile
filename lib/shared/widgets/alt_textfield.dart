import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class AltTextField extends StatefulWidget {
  const AltTextField({
    super.key, 
    this.label,
    this.controller,
    this.prefixText,
    this.suffixText,
    this.inputType,
    this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String? prefixText;
  final String? suffixText;
  final TextInputType? inputType;
  final String? label;
  final String? hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  State<AltTextField> createState() => _AltTextFieldState();
}

class _AltTextFieldState extends State<AltTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff344054)
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.grey5,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.w,
              color: AppColors.grey5,
            ),
          ),
          child: Row(
            children: [
              if (widget.prefixText != null) ...[
                Text(
                  widget.prefixText!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                SizedBox(width: 8.w),
              ],
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  keyboardType: widget.inputType,
                  obscureText: widget.isPassword,
                  onChanged: widget.onChanged,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey10,
                    letterSpacing: 0,
                  ),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: AppColors.grey7,
                    ),
                  ),
                ),
              ),
              if (widget.suffixText != null) ...[
                SizedBox(width: 8.w),
                Text(
                  widget.suffixText!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey7,
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}