import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../model/item_model.dart';

class RatingStarAndDateWidget extends StatelessWidget {
  const RatingStarAndDateWidget({
    Key? key,
    required this.myReview,
  }) : super(key: key);

  final ItemModel myReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const Spacer(),
        Text(
          myReview.date ?? '',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
