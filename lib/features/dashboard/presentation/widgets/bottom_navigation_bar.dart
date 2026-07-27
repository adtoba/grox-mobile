import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';

class PrimaryBottomNavigationBar extends StatefulWidget {
  const PrimaryBottomNavigationBar({super.key, required this.currentPage, required this.onPageChanged});

  final int currentPage;
  final Function(int) onPageChanged;    

  @override
  State<PrimaryBottomNavigationBar> createState() => _PrimaryBottomNavigationBarState();
}

class _PrimaryBottomNavigationBarState extends State<PrimaryBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(
            color: AppColors.grey3,
            width: 1
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.15),
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationItem(
              icon: "home",
              label: 'Home',
              isSelected: widget.currentPage == 0,
              onTap: () => widget.onPageChanged(0)
            ),
            BottomNavigationItem(
              icon: "wallet",
              label: 'Wallet',
              isSelected: widget.currentPage == 1,
              onTap: () => widget.onPageChanged(1)
            ),
            BottomNavigationItem(
              icon: "send",
              label: 'Send',
              isSelected: widget.currentPage == 2,
              onTap: () => widget.onPageChanged(2)
            ),
            BottomNavigationItem(
              icon: "p2p",
              label: 'P2P',
              isSelected: widget.currentPage == 3,
              onTap: () => widget.onPageChanged(3)
            ),
            BottomNavigationItem(
              icon: "more",
              label: 'More',
              isSelected: widget.currentPage == 4,
              onTap: () => widget.onPageChanged(4)
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key, 
    required this.icon, 
    required this.label,
    this.isSelected = false,
    this.onTap
  });

  final String icon;
  final String label;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSelected ? 120.w : null,
        height: 40.h,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: isSelected ? AppColors.primary : Colors.transparent
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(isSelected)...[
              Image.asset(
                icon.toPng, 
                color: AppColors.white,
                width: 40.w,
                height: 24.h
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? AppColors.white : AppColors.grey8,
                ),
              )
            ] else ...[
              Image.asset(
                icon.toPng, 
                color: isSelected 
                ? AppColors.white 
                : AppColors.grey8, 
                width: 40.w,
                height: 24.h
              ),
            ],
            
          ],
        ),
      ),
    );
  }
}