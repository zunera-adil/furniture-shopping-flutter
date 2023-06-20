import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/generated/assets/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/custome_divider.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/social_buttons_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AssetsImages.welcomeScreenBg),
        fit: BoxFit.fill,
      )),
      child: Column(
        children: [
          SizedBox(
            height: 231.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)?.welcome_screen_text('MAKE YOUR') ??
                  '',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)
                      ?.welcome_screen_text('HOME BEAUTIFUL') ??
                  '',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              AppLocalizations.of(context)?.welcome_screen_text(
                      'The best simple place where you discover most wonderful furnitures and make your home beautiful') ??
                  '',
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).hintColor, height: 1.7.h),
            ),
          ),
          SizedBox(
            height: 73.h,
          ),
          CustomButton(
            buttonText: AppLocalizations.of(context)?.login ?? '',
            onTap: () {
              Navigator.of(context).pushNamed(loginRoute);
            },
            width: 285.w,
            height: 50.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomButton(
            buttonText: AppLocalizations.of(context)?.create_account ?? '',
            onTap: () {
              Navigator.of(context).pushNamed(signUpRoute);
            },
            width: 285.w,
            height: 50.h,
          ),
          SizedBox(
            height: 26.h,
          ),
          TopBottomDivider(
            textForDivider: AppLocalizations.of(context)?.dividerText,
          ),
          SizedBox(
            height: 12.h,
          ),
          const SocialButtonsWidget(
            isBorderRequired: false,
          )
        ],
      ),
    );
  }
}
