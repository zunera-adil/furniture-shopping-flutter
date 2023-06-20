import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/rating_model.dart';
import '../../../../utills/colors.dart';

class ShowRatingBox extends StatelessWidget {
  final RatingModel ratingModel;
  const ShowRatingBox({Key? key, required this.ratingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.2),
                spreadRadius: 2.r,
                blurRadius: 30.r,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ratingModel.reviewerName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: theme.primaryColor),
                  ),
                  Text(
                    ratingModel.date ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 12.sp, color: theme.hintColor),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              RatingBarIndicator(
                rating: ratingModel.rating ?? 5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: kYellowStarColor,
                ),
                itemCount: 5,
                itemSize: 20.w,
                //direction: Axis.vertical,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                ratingModel.description ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      height: 1.5,
                    ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: -20.h,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ratingModel.reviewerImage ?? ''),
                  )),
            ))
      ],
    );
  }
}
