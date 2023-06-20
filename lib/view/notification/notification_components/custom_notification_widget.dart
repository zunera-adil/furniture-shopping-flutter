import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../model/notification_model.dart';
import '../../../utills/colors.dart';

class CustomNotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  final int? index;
  final int? newLabel;

  const CustomNotificationWidget(
      {Key? key, required this.notificationModel, this.index, this.newLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index == 0
          ? Theme.of(context).indicatorColor
          : Theme.of(context).scaffoldBackgroundColor,
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                  image: AssetImage(
                    notificationModel.image ?? '',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationModel.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  notificationModel.description ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                  textAlign: TextAlign.justify,
                ),
                newLabel == 0
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)?.new_button ?? '',
                          style: (Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: kSystemGreenColor,
                                  fontWeight: FontWeight.w800)),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
