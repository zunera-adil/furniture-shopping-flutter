import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/textfield.dart';
import '../../components/custom_back_button.dart';
import '../../utills/regex_pattren.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31.h,
              ),
              const BackArrowIconButton(),
              SizedBox(
                height: 24.h,
              ),
              Container(
                  height: 414.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        spreadRadius: 2.r,
                        blurRadius: 30.r,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 49.h,
                          ),
                          Text(
                            AppLocalizations.of(context)?.oops ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).hintColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            AppLocalizations.of(context)?.forgetYourPassword ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  fontSize: 24.sp,
                                ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppLocalizations.of(context)
                                    ?.forgetScreenDescription ??
                                '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: CustomTextField(
                                textLabel:
                                    AppLocalizations.of(context)?.email ?? '',
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return AppLocalizations.of(context)
                                            ?.emailValidatorNotEmpty ??
                                        '';
                                  } else if (!emailRegex.hasMatch(value) ||
                                      value.contains(' ')) {
                                    return AppLocalizations.of(context)
                                            ?.emailValidatorNotValidEmail ??
                                        '';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          CustomButton(
                              buttonText:
                                  AppLocalizations.of(context)?.reset ?? '',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pushReplacementNamed(
                                      confirmForgetPasswordRoute);
                                }
                              },
                              width: 285.w,
                              height: 50.w),
                          SizedBox(
                            height: 10.h,
                          )
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
