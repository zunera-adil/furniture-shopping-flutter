import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/view/profile/my_reviews/review_components/custom_review_card_widget.dart';
import '../../../generated/assets/icons.dart';
import '../../../generated/assets/images.dart';
import '../../../model/item_model.dart';

class MyReviews extends StatelessWidget {
  MyReviews({Key? key}) : super(key: key);
  final List<ItemModel> _itemList = [
    ItemModel(
        itemName: "Black Simple Lamp",
        image: [AssetsImages.item01Image],
        price: 12.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
    ItemModel(
        itemName: "Minimal Stand",
        image: [AssetsImages.item02Image],
        price: 25.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
    ItemModel(
        itemName: "Coffee Chair",
        image: [AssetsImages.item03Image],
        price: 20.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
    ItemModel(
        itemName: "Simple Desk",
        image: [AssetsImages.item04Image],
        price: 50.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
    ItemModel(
        itemName: "Coffee Chair",
        image: [AssetsImages.item03Image],
        price: 20.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast.Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
    ItemModel(
        itemName: "Simple Desk",
        image: [AssetsImages.item04Image],
        price: 50.0,
        date: '20/03/2020',
        description:
            'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
                size: 18.w,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              AppLocalizations.of(context)?.myReview_AppBar ?? '',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 16.sp),
            ),
            centerTitle: true,
            actions: [
              Image.asset(
                AssetsIcon.searchIcon,
              ),
            ]),
        body: ListView.separated(
          padding: EdgeInsets.all(20.h),
          itemBuilder: (BuildContext context, int index) {
            return CustomReviewCardWidget(
              myReview: _itemList[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20.h);
          },
          itemCount: _itemList.length,
        ));
  }
}
