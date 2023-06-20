import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final bool? isBorder;
  const SocialButton(
      {Key? key, required this.imageUrl, required this.onTap, this.isBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 40.h,
      width: 50.w,
      child: MaterialButton(
        elevation: 0,
        color: theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: isBorder!
                ? BorderSide(color: theme.hintColor)
                : BorderSide.none),
        onPressed: onTap,
        child: Image.asset(
          imageUrl,
          height: 28.h,
          width: 28.w,
        ),
      ),
    );
  }
}
