import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import 'package:furniture_shopping_flutter/model/rating_model.dart';
import 'package:furniture_shopping_flutter/view/home/rating_and_review/rating_component/rating_product_top_widget.dart';
import 'package:furniture_shopping_flutter/view/home/rating_and_review/rating_component/show_rating_box.dart';

import '../../../generated/assets/images.dart';

class ShowProductRating extends StatefulWidget {
  final ItemModel itemModel;
  const ShowProductRating({Key? key, required this.itemModel})
      : super(key: key);

  @override
  State<ShowProductRating> createState() => _ShowProductRatingState();
}

class _ShowProductRatingState extends State<ShowProductRating> {
  List<RatingModel> ratingList = [
    RatingModel(
        reviewerName: "Bruno Fernandes",
        date: "20/03/2020",
        reviewerImage: AssetsImages.productReviewProfile1,
        description:
            "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price"),
    RatingModel(
        reviewerName: "Tracy Mosby",
        date: "20/03/2020",
        reviewerImage: AssetsImages.productReviewProfile2,
        description:
            "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price color is also the same and quality is very good despite very cheap price color is also the same and quality is very good despite very cheap price color is also the same and quality is very good despite very cheap price")
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)?.product_rating_title ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: theme.primaryColor,
            size: 18.w,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  RatingProductTopWidget(itemModel: widget.itemModel),
                  SizedBox(
                    height: 15.h,
                  ),
                  Divider(
                    thickness: 1,
                    color: theme.cardColor,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: ratingList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: ShowRatingBox(ratingModel: ratingList[index]),
                        );
                      }),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 35.h,
            child: CustomButton(
                buttonText:
                    AppLocalizations.of(context)?.write_rating_button_text ??
                        '',
                onTap: () {},
                width: double.infinity,
                height: 50.h),
          )
        ],
      ),
    );
  }
}
