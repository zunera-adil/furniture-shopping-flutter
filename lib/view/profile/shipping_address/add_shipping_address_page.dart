import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/view/profile/profile_component/profile_custom_text_field.dart';
import 'package:furniture_shopping_flutter/view/profile/shipping_address/add_shipping_address_components/custom_drop_down_field.dart';
import '../../../model/shipping_address_model.dart';
import '../../../services/shipping_address_service.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController zipCodeController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
    cityController.dispose();
    districtController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  List<String> countries = ['Pakistan', 'Australia'];
  List<String> cities = ['Rawalpindi', 'islamabad', 'Sydney', 'Melbourne'];
  List<String> district = ['Rawalpindi', 'islamabad', 'Sydney', 'Melbourne'];
  String? _selectedCountry;
  String? _selectedCity;
  String? _selectedDistrict;

  final _nameFieldFormKey = GlobalKey<FormFieldState>();
  final _addressFieldFormKey = GlobalKey<FormFieldState>();
  final _zipcodeFieldFormKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
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
          AppLocalizations.of(context)?.add_shipping_address_title ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 19.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileCustomTextField(
                  controller: fullNameController,
                  hintText: "Ex: Bruno Pham",
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_name_field_label ??
                      '',
                  onChange: (value) {
                    fullNameController.text = value;
                    setState(() {});
                    if (_nameFieldFormKey.currentState!.validate()) {}
                  },
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  formKey: _nameFieldFormKey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ProfileCustomTextField(
                  controller: addressController,
                  hintText: "Ex: 25 Robert Latouche Street",
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_address_field_label ??
                      '',
                  onChange: (value) {
                    addressController.text = value;
                    setState(() {});
                    if (_addressFieldFormKey.currentState!.validate()) {}
                  },
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  formKey: _addressFieldFormKey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ProfileCustomTextField(
                  controller: zipCodeController,
                  hintText: "Ex: 01234",
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_zipcode_field_label ??
                      '',
                  onChange: (value) {
                    zipCodeController.text = value;
                    setState(() {});
                    if (_zipcodeFieldFormKey.currentState!.validate()) {}
                  },
                  isBorder: true,
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  formKey: _zipcodeFieldFormKey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomDropDownField(
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_country_field_label ??
                      '',
                  hintText: 'Select Country',
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  listItems: countries,
                  onChange: (String value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                  selectedValue: _selectedCountry,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomDropDownField(
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_city_field_label ??
                      '',
                  hintText: 'New York',
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  listItems: cities,
                  onChange: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  selectedValue: _selectedCity,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomDropDownField(
                  labelText: AppLocalizations.of(context)
                          ?.add_shipping_district_field_label ??
                      '',
                  hintText: 'Select District',
                  validator: (String? value, BuildContext context) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)
                              ?.add_shipping_validation_text ??
                          '';
                    }
                    return null;
                  },
                  onChange: (value) {
                    setState(() {
                      _selectedDistrict = value;
                    });
                  },
                  listItems: district,
                  selectedValue: _selectedDistrict,
                ),
                SizedBox(
                  height: 65.h,
                ),
                CustomButton(
                    buttonText: AppLocalizations.of(context)
                            ?.add_shipping_button_text ??
                        '',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ShippingAddressService()
                            .addShippingAddress(
                                ShippingAddressModel(
                                    nameField: fullNameController.text.trim(),
                                    addressField: addressController.text.trim(),
                                    postalCodeField:
                                        zipCodeController.text.trim(),
                                    countryField: _selectedCountry,
                                    cityField: _selectedCity,
                                    districtField: _selectedDistrict),
                                context)
                            .then((value) => fullNameController.clear());
                      }
                    },
                    width: 335.w,
                    height: 60.h),
                SizedBox(
                  height: 35.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
