import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardHolderInfoWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const CardHolderInfoWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall
              ?.copyWith(fontSize: 12.sp, color: theme.primaryColorLight),
        ),
        SizedBox(height: 5.h),
        Text(
          subTitle,
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.primaryColorLight),
        ),
      ],
    );
  }
}
