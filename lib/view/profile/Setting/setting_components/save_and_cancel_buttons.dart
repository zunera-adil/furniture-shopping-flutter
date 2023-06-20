import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_buttons.dart';

class SaveAndCancelButtons extends StatelessWidget {
  const SaveAndCancelButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            buttonText:
                AppLocalizations.of(context)?.setting_edit_box_cancel_button ??
                    '',
            onTap: () {
              Navigator.of(context).pop();
            },
            width: 120.w,
            height: 35.h),
        SizedBox(
          width: 26.w,
        ),
        CustomButton(
            buttonText:
                AppLocalizations.of(context)?.setting_edit_box_save_button ??
                    '',
            onTap: () {
              Navigator.of(context).pop();
            },
            width: 120.w,
            height: 35.h),
      ],
    );
  }
}
