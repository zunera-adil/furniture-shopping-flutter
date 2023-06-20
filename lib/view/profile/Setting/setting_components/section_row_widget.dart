import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitleWithOptionalEditIcon extends StatelessWidget {
  const SectionTitleWithOptionalEditIcon({
    Key? key,
    required this.text,
    this.editColorIcon,
    this.isEditable,
  }) : super(key: key);
  final String text;
  final String? editColorIcon;
  final VoidCallback? isEditable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 16.sp),
        ),
        const Spacer(),
        GestureDetector(
          onTap: isEditable,
          child: editColorIcon == null
              ? const SizedBox.shrink()
              : Image.asset(editColorIcon ?? ''),
        ),
      ],
    );
  }
}
