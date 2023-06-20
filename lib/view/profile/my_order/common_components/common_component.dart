import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderInfoBox extends StatelessWidget {
  final String orderStatus;

  const OrderInfoBox({
    Key? key,
    required this.theme,
    required this.orderStatus,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 335.w,
      margin:
          EdgeInsets.only(top: 15.0.h, left: 20.w, right: 20.w, bottom: 15.h),
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 40.0, // soften the shadow
            spreadRadius: -10.0, //extend the shadow
            offset: Offset(
              10.0, // Move to right 5  horizontally
              10.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Row(
              children: [
                Text(
                  "Order No238562312",
                  style: theme.textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  "20/03/2020",
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.hintColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Divider(
            color: theme.cardColor,
            thickness: 1.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)?.my_order_quantity ?? '',
                    style: theme.textTheme.titleMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: '03',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)?.my_order_total_amount ??
                        '',
                    style: theme.textTheme.titleMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\$150',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(right: 21.w),
            child: Row(
              children: [
                myOrderDetailButton(context: context, onTab: () {}),
                const Spacer(),
                Text(
                  orderStatus,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: kSystemGreenColor, fontSize: 16.sp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
