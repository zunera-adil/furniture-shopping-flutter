import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isBorder;
  final String hintText;
  final String labelText;
  final Function validator;
  final Function onChange;
  final VoidCallback? onTap;
  final GlobalKey formKey;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  const ProfileCustomTextField({
    Key? key,
    required this.formKey,
    this.onTap,
    required this.controller,
    this.isBorder = false,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.inputFormatter,
    required this.onChange,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: controller.text.isNotEmpty
            ? theme.scaffoldBackgroundColor
            : theme.indicatorColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(4.r),
        border: controller.text.isNotEmpty
            ? Border.all(color: theme.hintColor.withOpacity(.4))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              labelText,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          TextFormField(
            keyboardType: keyboardType,
            key: formKey,
            onTap: onTap,
            validator: (value) => validator(value, context),
            inputFormatters: inputFormatter,
            onChanged: (value) => onChange(value),
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              color: controller.text.isNotEmpty
                  ? theme.primaryColor
                  : theme.hintColor,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0.w, vertical: 0),
              hintStyle: theme.textTheme.titleMedium
                  ?.copyWith(fontSize: 16.sp, color: theme.hintColor),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
