import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import '../../../../utills/colors.dart';

class RatingProductTopWidget extends StatelessWidget {
  final ItemModel itemModel;
  const RatingProductTopWidget({Key? key, required this.itemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(itemModel.image?[0] ?? ''),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemModel.itemName ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: kYellowStarColor,
                    size: 25.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(itemModel.rating.toString(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 24.sp)),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              Text("${itemModel.totalReviews.toString()}  reviews",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        )
      ],
    );
  }
}
