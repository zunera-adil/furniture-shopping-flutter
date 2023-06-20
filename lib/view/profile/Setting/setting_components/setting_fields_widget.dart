import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';

class SettingFieldsWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isSwitched;
  final bool? isArrow;
  final bool switchButtonValue;
  final Function(bool value)? onChange;
  final bool isTitle;
  const SettingFieldsWidget({
    Key? key,
    this.title,
    this.isArrow = false,
    this.isSwitched = false,
    required this.switchButtonValue,
    this.onChange,
    this.subTitle,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 80.h,
        padding: EdgeInsets.only(
          left: 16.w,
        ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isTitle == true
                    ? Column(
                        children: [
                          Text(
                            title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      )
                    : const SizedBox(),
                Text(
                  subTitle ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Spacer(),
            isSwitched == true
                ? Transform.scale(
                    scale: 0.8,
                    child: Padding(
                        padding: EdgeInsets.only(right: 13.w),
                        child: CupertinoSwitch(
                            activeColor: kSystemGreenColor,
                            value: switchButtonValue,
                            onChanged: (value) => onChange!(value))),
                  )
                : isArrow == true
                    ? Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 16.w,
                          color: theme.primaryColor,
                        ),
                      )
                    : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

// Provider.of<SettingScreenProvider>(context,
// listen: true)
// .isNotifiable,
//
// Provider.of<SettingScreenProvider>(context,
// listen: false)
// .toggleNotification(value);
