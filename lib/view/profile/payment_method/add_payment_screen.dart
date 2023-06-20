import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/model/payment_card_model.dart';
import 'package:furniture_shopping_flutter/services/payment_method_service.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/payment_component/payment_card_widget.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/payment_utills/card_validation.dart';
import 'package:furniture_shopping_flutter/view/profile/profile_component/profile_custom_text_field.dart';
import 'payment_utills/card_input_formatter.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen>
    with TickerProviderStateMixin {
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(end: 1.0, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  final _formKey = GlobalKey<FormState>();
  final _nameFieldFormKey = GlobalKey<FormFieldState>();
  final _numberFieldFormKey = GlobalKey<FormFieldState>();
  final _cvvFieldFormKey = GlobalKey<FormFieldState>();
  final _expDateFieldFormKey = GlobalKey<FormFieldState>();
  bool isSwap = false;
  @override
  Widget build(BuildContext context) {
    PaymentCardModel paymentCardModel = PaymentCardModel(
      name: holderNameController.text.isEmpty
          ? 'XXXXXX'
          : holderNameController.text,
      number: cardNumberController.text.isEmpty
          ? '* * * *  * * * *  * * * *  XXXX'
          : cardNumberController.text,
    );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.primaryColor,
            size: 18.w,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocalizations.of(context)?.add_payment_title ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0005)
                  ..rotateY(pi * _animation.value),
                child: Transform(
                  alignment: Alignment.center,
                  transform:
                      Matrix4.rotationY(_animation.value >= 0.5 ? pi : 0.0),
                  child: _animation.value <= 0.5
                      ? PaymentCardWidget(
                          cardModel: paymentCardModel,
                          isSelected: true,
                          expDate: expiryDateController.text.isEmpty
                              ? 'XX/XX'
                              : expiryDateController.text)
                      : Container(
                          height: 180.h,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40.h,
                                color: theme.primaryColor,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Container(
                                  height: 40.h,
                                  width: 260.w,
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  color: theme.primaryColorLight,
                                  child: Text(
                                    "xxxx xxxx xxxx ${cvvController.text.isEmpty ? "xxx" : cvvController.text}",
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                            fontSize: 16.sp,
                                            color: theme.primaryColor),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                  textAlign: TextAlign.justify,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 10.sp,
                                      color: theme.primaryColorLight),
                                ),
                              )
                            ],
                          ),
                        ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        ProfileCustomTextField(
                          controller: holderNameController,
                          onTap: () {
                            _animationController.reverse();
                          },
                          hintText: AppLocalizations.of(context)
                                  ?.name_text_field_hint ??
                              '',
                          inputFormatter: [
                            LengthLimitingTextInputFormatter(25),
                          ],
                          validator: CardValidation.validateCardHolderName,
                          onChange: (name) {
                            holderNameController.text = name;
                            setState(() {});
                            if (_nameFieldFormKey.currentState!.validate()) {}
                          },
                          labelText:
                              AppLocalizations.of(context)?.card_holder_name ??
                                  '',
                          formKey: _nameFieldFormKey,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ProfileCustomTextField(
                          controller: cardNumberController,
                          onTap: () {
                            _animationController.reverse();
                          },
                          hintText: AppLocalizations.of(context)
                                  ?.number_text_field_hint ??
                              '',
                          keyboardType: TextInputType.number,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          isBorder: true,
                          validator: CardValidation.validateCardNum,
                          onChange: (cardNumber) {
                            cardNumberController.text = cardNumber;
                            setState(() {});
                            if (_numberFieldFormKey.currentState!.validate()) {}
                          },
                          labelText:
                              AppLocalizations.of(context)?.card_number ?? '',
                          formKey: _numberFieldFormKey,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProfileCustomTextField(
                                  controller: cvvController,
                                  onTap: () {
                                    _animationController.forward();
                                  },
                                  formKey: _cvvFieldFormKey,
                                  hintText: AppLocalizations.of(context)
                                          ?.cvv_text_field_hint ??
                                      '',
                                  keyboardType: TextInputType.number,
                                  validator: CardValidation.validateCVV,
                                  onChange: (cvvNumber) {
                                    cvvController.text = cvvNumber;
                                    setState(() {});
                                    if (_cvvFieldFormKey.currentState!
                                        .validate()) {}
                                  },
                                  inputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  labelText: AppLocalizations.of(context)
                                          ?.cvv_number ??
                                      ''),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Expanded(
                              child: ProfileCustomTextField(
                                controller: expiryDateController,
                                onTap: () {
                                  _animationController.reverse();
                                },
                                formKey: _expDateFieldFormKey,
                                hintText: AppLocalizations.of(context)
                                        ?.exp_text_field_hint ??
                                    '',
                                keyboardType: TextInputType.number,
                                isBorder: true,
                                labelText: AppLocalizations.of(context)
                                        ?.expiry_date_text_field_label ??
                                    '',
                                inputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  CardExpiryDateFormatter(),
                                ],
                                validator: CardValidation.validateDate,
                                onChange: (expiryDate) {
                                  expiryDateController.text = expiryDate;
                                  setState(() {});
                                  if (_expDateFieldFormKey.currentState!
                                      .validate()) {}
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 115.h,
                  ),
                  CustomButton(
                      buttonText:
                          AppLocalizations.of(context)?.add_payment_button ??
                              '',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          PaymentCardModel paymentModel = PaymentCardModel(
                            number: cardNumberController.text.trim(),
                            name: holderNameController.text.trim(),
                            cvv: cvvController.text.trim(),
                            expMonth: expiryDateController.text
                                .trim()
                                .substring(0, 2),
                            expYear:
                                expiryDateController.text.trim().substring(3),
                          );
                          PaymentMethodService()
                              .addPaymentCardData(paymentModel, context);
                        }
                      },
                      width: double.infinity,
                      height: 60.h),
                ],
              )),
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
