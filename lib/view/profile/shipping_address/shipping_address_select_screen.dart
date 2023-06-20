import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/shipping_address_model.dart';
import 'package:furniture_shopping_flutter/provider/shipping_address_provider.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/profile/shipping_address/shipping_address_select_screen_components/custom_shipping_address_info_box.dart';
import 'package:provider/provider.dart';

class ShippingAddressSelectedScreen extends StatefulWidget {
  const ShippingAddressSelectedScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressSelectedScreen> createState() =>
      _ShippingAddressSelectedScreenState();
}

class _ShippingAddressSelectedScreenState
    extends State<ShippingAddressSelectedScreen> {
  List<ShippingAddressModel> shippingAddressList = [];
  int selectedIndex = -1;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 5), () {
      Provider.of<ShippingAddressProvider>(context, listen: false)
          .getShippingData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shippingProvider =
        Provider.of<ShippingAddressProvider>(context, listen: true);
    shippingAddressList = shippingProvider.shippingAddressList;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Icon(
              Icons.arrow_back_ios,
              color: theme.primaryColor,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)
                  ?.shipping_address_selection_app_bar_text ??
              '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: shippingProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 15.h),
              itemCount: shippingAddressList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 31.h),
                      Row(
                        children: [
                          Checkbox(
                            value: selectedIndex == index
                                ? shippingProvider.isShippingAddressChecked
                                : false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            side:
                                BorderSide(width: 1.5, color: theme.hintColor),
                            onChanged: (value) {
                              selectedIndex = index;
                              shippingProvider
                                  .setIsShippingAddressChecked(value ?? false);
                            },
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            AppLocalizations.of(context)
                                    ?.shipping_address_selection_check_box_text ??
                                '',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      CustomShippingAddressInfoBox(
                        theme: theme,
                        fullName:
                            shippingAddressList[index].nameField ?? 'name',
                        address: shippingAddressList[index].addressField ??
                            'address',
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColorLight,
        child: Icon(
          Icons.add,
          color: theme.primaryColor,
        ),
        onPressed: () async{
         await Navigator.of(context).pushNamed(addShippingAddressRoute).then((value) {
           Provider.of<ShippingAddressProvider>(context, listen: false)
               .getShippingData();
         });
        },
      ),
    );
  }
}
