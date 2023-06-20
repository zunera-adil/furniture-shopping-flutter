import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const ProfileItemWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
              spreadRadius: 2.r,
              blurRadius: 30.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  subTitle,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.hintColor, fontSize: 12.sp),
                )
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 16.w,
              color: theme.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
