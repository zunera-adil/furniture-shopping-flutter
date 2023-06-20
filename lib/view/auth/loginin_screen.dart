import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/utills/regex_pattren.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/custome_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/social_buttons_widget.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/textfield.dart';
import '../../components/custom_buttons.dart';
import '../../generated/assets/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 65.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const TopBottomDivider(
                imageUrl: AssetsImages.topDividerLogo,
                isImageRequired: true,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppLocalizations.of(context)?.hello ?? '',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 24.sp, color: Theme.of(context).hintColor),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppLocalizations.of(context)?.welcomeBack ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: 24.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                width: 345.w,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
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
                              textLabel:
                                  AppLocalizations.of(context)?.email ?? '',
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return AppLocalizations.of(context)
                                          ?.passwordValidatorNotEmpty ??
                                      '';
                                }
                                return null;
                              },
                              obscureText: true,
                              textLabel:
                                  AppLocalizations.of(context)?.password ?? '',
                              isEyeIcon: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(forgetPasswordRoute);
                          },
                          child: Text(
                            AppLocalizations.of(context)?.forgetPassword ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontSize: 18.sp,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      CustomButton(
                        buttonText: AppLocalizations.of(context)?.login ?? '',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, bottomNavBarRoute);
                          }
                        },
                        width: 285.w,
                        height: 50.h,
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      TopBottomDivider(
                        textForDivider:
                            AppLocalizations.of(context)?.dividerText ?? '',
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      const SocialButtonsWidget(
                        isBorderRequired: true,
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)?.signUpFirst ?? '',
                              style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(signUpRoute);
                            },
                            child: Text(
                              AppLocalizations.of(context)?.signUnButton ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 61.h,
            ),
          ],
        ),
      ),
    );
  }
}
