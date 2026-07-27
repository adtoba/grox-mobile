import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/extensions/image_path_extension.dart';
import 'package:grox/core/theme/app_colors.dart';
import 'package:grox/features/welcome/presentation/widgets/page_indicator_widget.dart';
import 'package:grox/shared/widgets/primary_button.dart';
import 'package:grox/shared/widgets/secondary_button.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {

  final pageController = PageController();
  int currentPage = 0;

  final List<OnboardingPageItem> items = [
    OnboardingPageItem(
      title: "Grox is Money That Grows",
      subtitle: "Backed by real assets, transparent ROI",
      image: "onboarding1".toPng,
    ),  
    OnboardingPageItem(
      title: "Send Money. No Fees. Anywhere.",
      subtitle: "Remittances made seamless",
      image: "onboarding2".toPng,
    ),
    OnboardingPageItem(
      title: "Cash Out or Stake with Full Control",
      subtitle: "Spend it, grow it, or withdraw instantly",
      image: "onboarding3".toPng,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffAD1519),
              Color(0xffDB4446),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (v) {
                  setState(() {
                    currentPage = v;
                  });
                },
                children: items
              ),
            ),
            SizedBox(height: 24.h,),
            PageIndicatorWidget(
              currentPage: currentPage, 
              totalPages: items.length
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  PrimaryButton(
                    color: AppColors.white,
                    textColor: AppColors.poppy,
                    text: "Create Grox Account", 
                    onPressed: () {
                      
                    }
                  ),
                  SizedBox(height: 16.h),
                  SecondaryButton(
                    text: "Log In", 
                    color: Colors.transparent,
                    borderColor: AppColors.white,
                    textColor: AppColors.white,
                    onPressed: () {
                      
                    }
                  ),
                  SizedBox(height: 30.h,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            image,
            height: 448.h,
            width: 448.h,
            alignment: Alignment.centerRight,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white
            ),
          ),
        ),
        SizedBox(height: 8.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(  
            subtitle,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white
            ),
          ),
        )
      ],
    );
  }
}