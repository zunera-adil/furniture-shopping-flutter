import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';

import '../../../components/change_item_quantity_button.dart';

class ShowCartItemWidget extends StatelessWidget {
  final ItemModel itemModel;
  const ShowCartItemWidget({Key? key, required this.itemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemModel.itemName ?? '',
                  style: theme.textTheme.titleMedium),
              SizedBox(
                height: 6.h,
              ),
              Text("\$ ${itemModel.price}",
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700)),
              const Spacer(),
              Row(
                children: [
                  changeItemButton(
                      iconUrl: AssetsIcon.plusIcon,
                      context: context,
                      onTap: () {}),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text('',
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: theme.primaryColor)),
                  SizedBox(
                    width: 15.w,
                  ),
                  changeItemButton(
                      iconUrl: AssetsIcon.minusIcon,
                      context: context,
                      onTap: () {}),
                ],
              )
            ],
          )),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              AssetsIcon.closeIcon,
              width: 20.w,
              height: 20.h,
            ),
          )
        ],
      ),
    );
  }
}
