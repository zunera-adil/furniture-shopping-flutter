import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import 'custom_rating_stars_and_date_widget.dart';

class CustomReviewCardWidget extends StatelessWidget {
  const CustomReviewCardWidget({Key? key, required this.myReview})
      : super(key: key);
  final ItemModel myReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor.withOpacity(0.2),
            spreadRadius: 2.r,
            blurRadius: 40.r,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Container(
              height: 70.w,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                    image: AssetImage(myReview.image![0]), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myReview.itemName ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "\$ ${myReview.price.toString()}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w800, fontSize: 16.sp),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 15.h,
          ),
          RatingStarAndDateWidget(myReview: myReview),
          SizedBox(
            height: 15.h,
          ),
          Text(
            myReview.description ?? '',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
