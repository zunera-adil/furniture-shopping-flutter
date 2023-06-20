import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingFormFieldWidget extends StatefulWidget {
  const SettingFormFieldWidget({
    Key? key,
    this.label,
    this.hintText,
    this.isEyeIcon = false,
  }) : super(key: key);
  final String? label;
  final String? hintText;
  final bool isEyeIcon;

  @override
  State<SettingFormFieldWidget> createState() => _SettingFormFieldWidgetState();
}

class _SettingFormFieldWidgetState extends State<SettingFormFieldWidget> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = _isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.2),
              spreadRadius: 2.r,
              blurRadius: 30.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.label ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
            TextFormField(
              obscuringCharacter: '*',
              obscureText: _isObscure,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                suffixIcon: widget.isEyeIcon
                    ? IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).indicatorColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        })
                    : const SizedBox(),
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).indicatorColor.withOpacity(0.7)),
                hintText: widget.hintText,
              ),
            )
          ],
        ));
  }
}
