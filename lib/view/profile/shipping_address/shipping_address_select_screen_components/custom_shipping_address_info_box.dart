import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';

class CustomShippingAddressInfoBox extends StatelessWidget {
  final ThemeData theme;
  final String fullName;
  final String address;

  const CustomShippingAddressInfoBox({
    Key? key,
    required this.theme,
    required this.fullName,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 40.0, // soften the shadow
            spreadRadius: -10.0, //extend the shadow
            offset: const Offset(
              10.0, // Move to right 5  horizontally
              10.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  fullName,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 19.98.h,
                  width: 16.w,
                  child: Image.asset(
                    AssetsIcon.editColorIcon,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 13.h),
          const Divider(),
          SizedBox(height: 11.h),
          Padding(
            padding: EdgeInsets.only(left: 18.w, right: 5.w),
            child: Text(
              address,
              style:
                  theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
