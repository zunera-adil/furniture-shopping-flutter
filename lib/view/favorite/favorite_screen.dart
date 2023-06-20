import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import '../../generated/assets/icons.dart';
import '../../generated/assets/images.dart';
import '../../model/item_model.dart';
import 'favorite_components/custom_favorite_screen_widget.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
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
    return Scaffold(
        appBar: AppBar(
            leading: SizedBox(
              height: 20.h,
              width: 20.w,
              child: Image.asset(AssetsIcon.searchIcon),
            ),
            title: Text(
              AppLocalizations.of(context)?.favourites ?? '',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 16.sp),
            ),
            centerTitle: true,
            actions: [
              Image.asset(AssetsIcon.cartIcon),
            ]),
        body: Stack(children: [
          ListView.separated(
            padding: EdgeInsets.only(bottom: 120.h),
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) =>
                CustomFavoriteScreenWidget(itemModel: _itemList[index]),
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Divider(
                  indent: 20.w,
                  endIndent: 20.w,
                  color: Theme.of(context).indicatorColor,
                ),
              );
            },
          ),
          Positioned(
            left: 21.w,
            bottom: 21.h,
            child: CustomButton(
                buttonText:
                    AppLocalizations.of(context)?.add_all_to_my_cart ?? '',
                onTap: () {},
                width: 334.w,
                height: 50.h),
          )
        ]));
  }
}
