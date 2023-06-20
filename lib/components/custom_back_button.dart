import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowIconButton extends StatelessWidget {
  const BackArrowIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 40.w,
        width: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.5),
              spreadRadius: 4.r,
              blurRadius: 40.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios,
          size: 15.w,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
