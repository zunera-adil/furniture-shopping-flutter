import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownField extends StatefulWidget {
  const CustomDropDownField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.listItems,
    required this.onChange,
    this.selectedValue,
  }) : super(key: key);
  final String hintText;
  final String? selectedValue;
  final String labelText;
  final Function validator;
  final Function onChange;
  final List<String> listItems;

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: widget.selectedValue != null
            ? theme.scaffoldBackgroundColor
            : theme.indicatorColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(4.r),
        border: widget.selectedValue != null
            ? Border.all(color: theme.hintColor.withOpacity(.4))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              widget.labelText,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          DropdownButtonFormField(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18.w,
            ),
            value: widget.selectedValue,
            hint: Text(
              widget.hintText,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontSize: 16.sp, color: theme.hintColor),
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            isExpanded: true,
            onChanged: (value) => widget.onChange(value),
            //[validator: (value) => widget.validator(value, context),
            items: widget.listItems.map((val) {
              return DropdownMenuItem(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  value: val,
                  child: Text(
                    val,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color:
                          val.isNotEmpty ? theme.primaryColor : theme.hintColor,
                    ),
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
