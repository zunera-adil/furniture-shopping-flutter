import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import '../../../generated/assets/icons.dart';

class CustomShowItemWidget extends StatelessWidget {
  final ItemModel itemModel;
  const CustomShowItemWidget({required this.itemModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 157.w,
      height: 253.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(productDetailScreenRoute, arguments: itemModel);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                      image: AssetImage(
                        itemModel.image?[0] ?? '',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: theme.hintColor.withOpacity(.4),
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Image.asset(AssetsIcon.shoppingBagWhiteIcon),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(itemModel.itemName ?? '', style: theme.textTheme.headlineSmall),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "\$ ${itemModel.price.toString()}",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
