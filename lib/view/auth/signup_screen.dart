import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/images.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/custome_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/social_buttons_widget.dart';
import 'package:furniture_shopping_flutter/view/auth/widgets/textfield.dart';
import '../../components/custom_buttons.dart';
import '../../utills/regex_pattren.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 65.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const TopBottomDivider(
                imageUrl: AssetsImages.topDividerLogo,
                isImageRequired: true,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              AppLocalizations.of(context)?.welcome ?? '',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              height: 21.h,
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
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),

                        /// form for validation
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  textLabel:
                                      AppLocalizations.of(context)?.name ?? '',
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                              ?.nameValidatorNotEmpty ??
                                          '';
                                    } else if (value.length < 2) {
                                      return AppLocalizations.of(context)
                                              ?.nameValidatorNotLessThenTwoChar ??
                                          '';
                                    }
                                    return null;
                                  },
                                  controller: _nameController,
                                ),
                                SizedBox(
                                  height: 38.h,
                                ),
                                CustomTextField(
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
                                SizedBox(
                                  height: 38.h,
                                ),
                                CustomTextField(
                                  textLabel:
                                      AppLocalizations.of(context)?.password ??
                                          '',
                                  isEyeIcon: true,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                              ?.passwordValidatorNotEmpty ??
                                          '';
                                    } else if (value.length < 6) {
                                      return AppLocalizations.of(context)
                                              ?.passwordValidatorNotLessThenSixChar ??
                                          '';
                                    } else if (!letterAndNumberRegex
                                        .hasMatch(value)) {
                                      return AppLocalizations.of(context)
                                              ?.passwordValidatorMixtureOfLettersNo ??
                                          '';
                                    } else if (!specialCharacterRegex
                                        .hasMatch(value)) {
                                      return AppLocalizations.of(context)
                                              ?.passwordValidatorForSpecialChar ??
                                          '';
                                    }
                                    return null;
                                  },
                                  controller: _passwordController,
                                ),
                                SizedBox(
                                  height: 38.h,
                                ),
                                CustomTextField(
                                  textLabel: AppLocalizations.of(context)
                                          ?.confirmPassword ??
                                      '',
                                  isEyeIcon: true,
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return AppLocalizations.of(context)
                                              ?.confirmPasswordValidatorNotEmpty ??
                                          '';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return AppLocalizations.of(context)
                                              ?.confirmPasswordValidatorPasswordNotMatch ??
                                          '';
                                    }
                                    return null;
                                  },
                                  controller: _confirmPasswordController,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 28.h,
                        ),
                        CustomButton(
                          buttonText:
                              AppLocalizations.of(context)?.create_account ??
                                  '',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          width: 285.w,
                          height: 50.h,
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        TopBottomDivider(
                          textForDivider:
                              AppLocalizations.of(context)?.dividerText ?? '',
                        ),
                        SizedBox(
                          height: 12.h,
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
                            Text(AppLocalizations.of(context)?.isSignUp ?? '',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(loginRoute);
                              },
                              child: Text(
                                  AppLocalizations.of(context)?.signInButton ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color:
                                              Theme.of(context).primaryColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 22.h,
            )
          ],
        ),
      ),
    );
  }
}
