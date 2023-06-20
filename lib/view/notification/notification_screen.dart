import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/notification_model.dart';
import '../../generated/assets/icons.dart';
import '../../generated/assets/images.dart';
import 'notification_components/custom_notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final List<NotificationModel> _notificationList = [
    NotificationModel(
        title: 'Your order #123456789 has been confirmed',
        image: AssetsImages.item02Image,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            'Turpis pretium et in arcu adipiscing nec. Turpis pretium et'
            'in arcu adipiscing nec. '),
    NotificationModel(
        title: 'Your order #123456789 has been canceled',
        image: AssetsImages.item01Image,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            ' Turpis pretium et in arcu adipiscing nec. Turpis pretium et'
            'in arcu adipiscing nec.'),
    NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        image: AssetsImages.item03Image,
        description:
            'Please help us to confirm and rate your order to get 10% discount code for next order.'),
    NotificationModel(
        title: 'Your order #123456789 has been confirmed',
        image: AssetsImages.item03Image,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            ' Turpis pretium et in arcu adipiscing nec. Turpis pretium et'
            'in arcu adipiscing nec.'),
    NotificationModel(
        title: "Your order #123456789 has been canceled",
        image: AssetsImages.item04Image,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            ' Turpis pretium et in arcu adipiscing nec. Turpis pretium et'
            'in arcu adipiscing nec.'),
    NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        image: AssetsImages.item03Image,
        description:
            'Please help us to confirm and rate your order to get 10% discount code for next order.'),
    NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        image: AssetsImages.item03Image,
        description:
            'Please help us to confirm and rate your order to get 10% discount code for next order.'),
    NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        image: AssetsImages.item03Image,
        description:
            'Please help us to confirm and rate your order to get 10% discount code for next order.'),
    NotificationModel(
        title: 'Your order #123456789 has been shipped successfully',
        image: AssetsImages.item03Image,
        description:
            'Please help us to confirm and rate your order to get 10% discount code for next order.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 20.h,
          width: 20.w,
          child: Image.asset(AssetsIcon.searchIcon),
        ),
        title: Text(
          AppLocalizations.of(context)?.notification ?? '',
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: ListView.separated(
          itemCount: _notificationList.length,
          itemBuilder: (BuildContext context, int index) =>
              CustomNotificationWidget(
            notificationModel: _notificationList[index],
            index: index,
            newLabel: index,
          ),
          separatorBuilder: (BuildContext context, int index) {
            return index == 0
                ? const SizedBox()
                : Divider(
                    thickness: 1.h,
                    indent: 20.w,
                    endIndent: 20.w,
                    color: Theme.of(context).indicatorColor,
                  );
          },
        ),
      ),
    );
  }
}
