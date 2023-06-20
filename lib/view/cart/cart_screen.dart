import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/view/cart/cart_component/promo_text_field_widget.dart';
import 'package:furniture_shopping_flutter/view/cart/cart_component/show_cart_item_widget.dart';
import '../../generated/assets/images.dart';
import '../../model/item_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController promoTextController = TextEditingController();
  final List<ItemModel> _itemList = [
    ItemModel(
        itemName: "Black Simple Lamp",
        image: [AssetsImages.item01Image],
        price: 12.0),
    ItemModel(
        itemName: "Minimal Stand",
        image: [AssetsImages.item02Image],
        price: 25.0),
    ItemModel(
      itemName: "Coffee Chair",
      image: [AssetsImages.item03Image],
      price: 20.0,
    ),
    ItemModel(
      itemName: "Simple Desk",
      image: [AssetsImages.item04Image],
      price: 50.0,
    ),
    ItemModel(
      itemName: "Coffee Chair",
      image: [AssetsImages.item03Image],
      price: 20.0,
    ),
    ItemModel(
      itemName: "Simple Desk",
      image: [AssetsImages.item04Image],
      price: 50.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.my_cart ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18.w,
            color: theme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 14.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _itemList.length,
                itemBuilder: (context, index) {
                  return ShowCartItemWidget(itemModel: _itemList[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(
                      color: theme.indicatorColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            PromoTextField(controller: promoTextController),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:",
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 20.sp)),
                  Text("\$ 95.00",
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
                buttonText: "Check out",
                onTap: () {},
                width: double.infinity,
                height: 60.h),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
