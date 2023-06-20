import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromoTextField extends StatelessWidget {
  final TextEditingController controller;
  const PromoTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 44.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
              spreadRadius: 2.r,
              blurRadius: 30.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                hintStyle: theme.textTheme.bodySmall
                    ?.copyWith(fontSize: 16.sp, color: theme.hintColor),
                hintText: AppLocalizations.of(context)?.promo_text_title ?? '',
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 44.h,
                width: 44.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15.w,
                  color: theme.primaryColorLight,
                ),
              ),
            )
          ],
        ));
  }
}
