import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// background onboarding image
ImageProvider backgroundOnboardingImage(AssetImage bgImage) => bgImage;

/// onboarding text
Widget onboardingText(String onboardingText, BuildContext onboardingContext) =>
    Padding(
      padding: EdgeInsets.only(left: 34.w, right: 34.w, top: 23.h),
      child: Text(
        onboardingText,
        textAlign: TextAlign.center,
        style: Theme.of(onboardingContext).textTheme.displayLarge,
      ),
    );

/// slider indicator of images onboarding

class SliderIndicator extends StatelessWidget {
  final int onboardingListLength;
  final int currentOnboarding;

  const SliderIndicator(
      {Key? key,
      required this.onboardingListLength,
      required this.currentOnboarding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i <= onboardingListLength; i++)
          Container(
            height: 6.h,
            width: currentOnboarding == i ? 25.w : 6.w,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: currentOnboarding == i
                  ? Theme.of(context).hintColor
                  : Theme.of(context).indicatorColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
      ],
    );
  }
}
