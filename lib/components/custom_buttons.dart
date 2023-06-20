import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// add all to my cart button.

Widget addAllToMyCart(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 50.h,
      width: 334.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.add_all_to_my_cart ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

/// checkout button.

Widget checkOut(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 60.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.check_out ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

/// details my order button
Widget myOrderDetailButton(
        {required BuildContext context, required VoidCallback onTab}) =>
    GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        height: 36.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: kPrimaryBlackColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
        ),
        child: Text(
          AppLocalizations.of(context)?.my_order_button_text ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );

/// next button.

Widget nextOrGetStarted(
        {required BuildContext context,
        required String buttonText,
        required VoidCallback onTab}) =>
    GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        height: 60.h,
        width: 334.w,
        decoration: BoxDecoration(
          color: kPrimaryBlackColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          buttonText == 'Next'
              ? AppLocalizations.of(context)?.next ?? ''
              : AppLocalizations.of(context)?.get_started ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );

/// track your order button.

Widget trackYourOrder(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 60.h,
      width: 315.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.track_your_order ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

/// get started button.

Widget getStarted(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 54.h,
      width: 159.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.get_started ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

/// login Button.

Widget loginButton(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 50.h,
      width: 285.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.login ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

/// create an account Button.

Widget createAccountButton(
        {required BuildContext context, required VoidCallback onTab}) =>
    GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        width: 285.w,
        decoration: BoxDecoration(
          color: kPrimaryBlackColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          AppLocalizations.of(context)?.create_account ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );

/// add to cart button.

Widget addToCart(BuildContext context) => Container(
      alignment: Alignment.center,
      height: 60.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: kPrimaryBlackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        AppLocalizations.of(context)?.add_to_cart ?? '',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double width;
  final double height;

  const CustomButton({
    required this.buttonText,
    required this.onTap,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        elevation: 1,
        color: theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        onPressed: onTap,
        child: Text(buttonText, style: theme.textTheme.labelLarge),
      ),
    );
  }
}
