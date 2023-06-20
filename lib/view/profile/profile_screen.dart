import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';
import 'package:furniture_shopping_flutter/generated/assets/images.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/profile/profile_component/profile_item_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.profile ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Image.asset(AssetsIcon.searchIcon),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Image.asset(AssetsIcon.logoutIcon),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AssetsImages.userProfile),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bruno Pham",
                      style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: 20.sp,
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("bruno203@gmail.com",
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.hintColor))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ProfileItemWidget(
              title: AppLocalizations.of(context)?.profile_myOrder_title ?? '',
              subTitle:
                  AppLocalizations.of(context)?.profile_myOrder_subTitle ?? '',
              onTap: () {
                Navigator.of(context).pushNamed(myOderRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileItemWidget(
              title: AppLocalizations.of(context)?.profile_shipping_title ?? '',
              subTitle:
                  AppLocalizations.of(context)?.profile_shipping_subTitle ?? '',
              onTap: () {
                Navigator.of(context)
                    .pushNamed(shippingAddressSelectScreenRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileItemWidget(
              title: AppLocalizations.of(context)?.profile_payment_title ?? '',
              subTitle:
                  AppLocalizations.of(context)?.profile_payment_subTitle ?? '',
              onTap: () {
                Navigator.pushNamed(context, showPaymentRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileItemWidget(
              title: AppLocalizations.of(context)?.profile_review_title ?? '',
              subTitle:
                  AppLocalizations.of(context)?.profile_review_subTitle ?? '',
              onTap: () {
                Navigator.pushNamed(context, myReviewsScreenRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ProfileItemWidget(
              title: AppLocalizations.of(context)?.profile_setting_title ?? '',
              subTitle:
                  AppLocalizations.of(context)?.profile_setting_subTitle ?? '',
              onTap: () {
                Navigator.pushNamed(context, settingScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
