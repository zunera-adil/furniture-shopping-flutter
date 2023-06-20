import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets/icons.dart';
import '../../../model/item_model.dart';

class CustomFavoriteScreenWidget extends StatelessWidget {
  final ItemModel itemModel;
  const CustomFavoriteScreenWidget({Key? key, required this.itemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                  image: AssetImage(
                    itemModel.image?[0] ?? '',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemModel.itemName ?? '',
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "\$ ${itemModel.price.toString()}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Image.asset(AssetsIcon.closeIcon),
              SizedBox(
                height: 42.h,
              ),
              Container(
                  width: 30.w,
                  height: 30.h,
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).indicatorColor.withOpacity(.4),
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Image.asset(AssetsIcon.shoppingBagIcon)),
            ],
          ),
        ],
      ),
    );
  }
}
