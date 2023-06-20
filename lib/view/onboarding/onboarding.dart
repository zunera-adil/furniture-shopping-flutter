import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/generated/assets/images.dart';
import 'package:furniture_shopping_flutter/model/onboarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import 'package:furniture_shopping_flutter/view/onboarding/onboarding_components/onboarding_components.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoarding> onboardingListData = [];
  late PageController controller;

  late AssetImage assetImage1;
  late AssetImage assetImage2;
  late AssetImage assetImage3;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    assetImage1 = const AssetImage(AssetsImages.onboarding1Image);
    precacheImage(assetImage1, context);
    assetImage2 = const AssetImage(AssetsImages.onboarding2Image);
    precacheImage(assetImage2, context);
    assetImage3 = const AssetImage(AssetsImages.onboarding3Image);
    precacheImage(assetImage3, context);
    super.didChangeDependencies();
  }

   @override
  Widget build(BuildContext context) {
    onboardingListData = [
      OnBoarding(
        image: assetImage1,
        onboardingText: AppLocalizations.of(context)?.on_boarding_text(
              'We Provide high quailty  product only for you',
            ) ??
            '',
        currentOnboardingPage: 0,
      ),
      OnBoarding(
        image: assetImage2,
        onboardingText: AppLocalizations.of(context)?.on_boarding_text(
              'Your satisfication is our number one priority',
            ) ??
            '',
        currentOnboardingPage: 1,
      ),
      OnBoarding(
        image: assetImage3,
        onboardingText: AppLocalizations.of(context)?.on_boarding_text(
              'Let’s fulfil your house needs with nexttier right now ',
            ) ??
            '',
        currentOnboardingPage: 2,
      ),
    ];
    return SafeArea(
      child: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: onboardingListData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: onboardingListData[index].image,
              fit: BoxFit.fill,
            )),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 277.h,
              color: kPrimaryWhiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  onboardingText(
                      onboardingListData[index].onboardingText, context),
                  SizedBox(height: 11.h),
                  SliderIndicator(
                    onboardingListLength: onboardingListData.length - 1,
                    currentOnboarding:
                        onboardingListData[index].currentOnboardingPage,
                  ),
                  SizedBox(height: 22.h),
                  nextOrGetStarted(
                    buttonText: index != onboardingListData.length - 1
                        ? 'Next'
                        : 'Get Started',
                    context: context,
                    onTab: () {
                      index != onboardingListData.length - 1
                          ? controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn)
                          : Navigator.of(context)
                              .pushReplacementNamed(welcomeRoute);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
