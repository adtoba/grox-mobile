import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/theme/app_colors.dart';

class AltDropdownField<T> extends StatelessWidget {
  const AltDropdownField({
    super.key,
    this.label,
    this.prefixText,
    this.suffixText,
    this.hintText,
    this.value,
    required this.items,
    required this.onChanged,
    this.showDropdownIcon = true,
  });

  final String? label;
  final String? prefixText;
  final String? suffixText;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final bool showDropdownIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff344054),
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          decoration: BoxDecoration(
            color: AppColors.grey5,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.w,
              color: AppColors.grey3,
            ),
          ),
          child: Row(
            children: [
              if (prefixText != null) ...[
                Text(
                  prefixText!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey9,
                  ),
                ),
                SizedBox(width: 8.w),
              ],
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    value: value,
                    isExpanded: true,
                    icon: const SizedBox.shrink(),
                    hint: hintText == null
                        ? null
                        : Text(
                            hintText!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey7,
                            ),
                          ),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey10,
                    ),
                    dropdownColor: AppColors.white,
                    items: items,
                    onChanged: onChanged,
                  ),
                ),
              ),
              if (suffixText != null) ...[
                SizedBox(width: 8.w),
                Text(
                  suffixText!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey7,
                  ),
                ),
              ],
              if (showDropdownIcon) ...[
                SizedBox(width: 8.w),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20.sp,
                  color: AppColors.grey8,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
