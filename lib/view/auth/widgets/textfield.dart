import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String textLabel;
  final bool? obscureText;
  final TextEditingController controller;
  final bool isEyeIcon;
  final Function validator;
  const CustomTextField(
      {Key? key,
      required this.textLabel,
      this.isEyeIcon = false,
      required this.validator,
      required this.controller,
      this.obscureText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;
  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => widget.validator(value),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.only(top: 10),
        labelText: widget.textLabel,
        suffixIcon: widget.isEyeIcon
            ? IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                })
            : const SizedBox(),
      ),
      obscureText: _isObscure,
    );
  }
}
