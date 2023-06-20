import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/edit_name_information_box.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/edit_password_information_box.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/section_row_widget.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/setting_fields_widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/setting_screen_provider.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.setting_AppBar ?? '',
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18.w,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 22.h,
          ),
          SectionTitleWithOptionalEditIcon(
            text: AppLocalizations.of(context)?.setting_TopTitle ?? '',
            editColorIcon: AssetsIcon.editProfileIcon,
            isEditable: () {
              editInfoBoxForName(context);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
            isTitle: true,
            title: AppLocalizations.of(context)?.setting_NameFieldTitle ?? '',
            subTitle: 'Bruno Pham',
            switchButtonValue: false,
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
            isTitle: true,
            title: AppLocalizations.of(context)?.email ?? '',
            subTitle: 'bruno203@gmail.com',
            switchButtonValue: false,
          ),
          SizedBox(
            height: 35.h,
          ),
          SectionTitleWithOptionalEditIcon(
            text: AppLocalizations.of(context)?.password ?? '',
            editColorIcon: AssetsIcon.editProfileIcon,
            isEditable: () {
              editInfoBoxForPassword(context);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          const SettingFieldsWidget(
            subTitle: '**********',
            switchButtonValue: false,
          ),
          SizedBox(
            height: 35.h,
          ),
          SectionTitleWithOptionalEditIcon(
            text: AppLocalizations.of(context)?.setting_NotificationsTopTitle ??
                '',
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
              subTitle: AppLocalizations.of(context)
                      ?.setting_NotificationFirstFieldTitle ??
                  '',
              isSwitched: true,
              switchButtonValue:
                  Provider.of<SettingScreenProvider>(context, listen: true)
                      .isNotifySales,
              onChange: (bool value) {
                Provider.of<SettingScreenProvider>(context, listen: false)
                    .toggleNotification(0, value);
              }),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
              subTitle: AppLocalizations.of(context)
                      ?.setting_NotificationSecondFieldTitle ??
                  '',
              isSwitched: true,
              switchButtonValue:
                  Provider.of<SettingScreenProvider>(context, listen: true)
                      .isNotifyNewArrivals,
              onChange: (bool value) {
                Provider.of<SettingScreenProvider>(context, listen: false)
                    .toggleNotification(1, value);
              }),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
              subTitle: AppLocalizations.of(context)
                      ?.setting_NotificationThirdFieldTitle ??
                  '',
              isSwitched: true,
              switchButtonValue:
                  Provider.of<SettingScreenProvider>(context, listen: true)
                      .isNotifyDeliveryStatus,
              onChange: (bool value) {
                Provider.of<SettingScreenProvider>(context, listen: false)
                    .toggleNotification(2, value);
              }),
          SizedBox(
            height: 35.h,
          ),
          SectionTitleWithOptionalEditIcon(
            text:
                AppLocalizations.of(context)?.setting_HelpCenterTopTitle ?? '',
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
            subTitle: AppLocalizations.of(context)
                    ?.setting_HelpCenterFirstFieldTitle ??
                '',
            isArrow: true,
            switchButtonValue: false,
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
            subTitle: AppLocalizations.of(context)
                    ?.setting_HelpCenterSecondFieldTitle ??
                '',
            isArrow: true,
            switchButtonValue: false,
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingFieldsWidget(
            subTitle: AppLocalizations.of(context)
                    ?.setting_HelpCenterThirdFieldTitle ??
                '',
            isArrow: true,
            switchButtonValue: false,
          ),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}
