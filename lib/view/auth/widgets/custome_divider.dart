import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';

class TopBottomDivider extends StatelessWidget {
  final String? textForDivider;
  final String? imageUrl;
  final bool isImageRequired;
  const TopBottomDivider(
      {Key? key,
      this.isImageRequired = false,
      this.imageUrl,
      this.textForDivider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.h,
            color: kSecondaryGreyColor,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        isImageRequired
            ? Image.asset(imageUrl ?? '')
            : Text(
                textForDivider ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Divider(
            thickness: 1.h,
            color: kSecondaryGreyColor,
          ),
        ),
      ],
    );
  }
}
