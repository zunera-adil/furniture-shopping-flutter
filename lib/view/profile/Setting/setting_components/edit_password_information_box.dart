import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/save_and_cancel_buttons.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/setting_components/setting_editable_fields_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@override
editInfoBoxForPassword(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.r))),
          content: SizedBox(
            width: 345.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)?.setting_edit_box_title ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SettingFormFieldWidget(
                  label: AppLocalizations.of(context)
                          ?.setting_edit_box_password_field ??
                      '',
                  hintText: '**********',
                  isEyeIcon: true,
                ),
                SizedBox(
                  height: 18.h,
                ),
                SettingFormFieldWidget(
                  label: AppLocalizations.of(context)
                          ?.setting_edit_box_confirm_password_field ??
                      '',
                  hintText: '**********',
                  isEyeIcon: true,
                ),
                SizedBox(
                  height: 22.h,
                ),
                const SaveAndCancelButtons(),
              ],
            ),
          ),
        );
      });
}
