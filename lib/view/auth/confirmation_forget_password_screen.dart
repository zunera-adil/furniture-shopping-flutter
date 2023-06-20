import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/images.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import '../../components/custom_back_button.dart';
import '../../components/custom_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31.h,
              ),
              const BackArrowIconButton(),
              SizedBox(
                height: 70.h,
              ),
              Container(
                  height: 414.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        spreadRadius: 2.r,
                        blurRadius: 30.r,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 51.h,
                        ),
                        Image.asset(AssetsImages.circleEmail),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          AppLocalizations.of(context)?.checkYourEmail ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(fontSize: 24.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                            AppLocalizations.of(context)
                                    ?.confirmScreenDescription ??
                                '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(
                          height: 42.h,
                        ),
                        CustomButton(
                            buttonText: AppLocalizations.of(context)?.ok ?? '',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, loginRoute);
                            },
                            width: 285.w,
                            height: 50.w)
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
