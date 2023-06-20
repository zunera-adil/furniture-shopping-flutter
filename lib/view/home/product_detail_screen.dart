import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/components/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import '../../components/change_item_quantity_button.dart';
import '../../generated/assets/icons.dart';
import 'home_components/product_detail_screen_components/custom_top_widget.dart';

class DetailScreen extends StatefulWidget {
  final ItemModel item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: DetailTopWidget(item: widget.item),
        ),
        SizedBox(
          height: 25.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Text(widget.item.itemName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${widget.item.price.toString()}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 30.sp),
                    ),
                    const Spacer(),
                    changeItemButton(
                      iconUrl: AssetsIcon.plusIcon,
                      context: context,
                      onTap: () {
                        setState(() {
                          _itemCount++;
                        });
                      },
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text('$_itemCount',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Theme.of(context).primaryColor)),
                    SizedBox(
                      width: 15.w,
                    ),
                    changeItemButton(
                        iconUrl: AssetsIcon.minusIcon,
                        context: context,
                        onTap: () {
                          setState(() {
                            if (_itemCount > 0) {
                              _itemCount--;
                            }
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      widget.item.rating.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, productRatingRoute,
                          arguments: widget.item),
                      child: Text(
                          "(${widget.item.totalReviews.toString()}  reviews)",
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  widget.item.description ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 60.w,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        CupertinoIcons.heart,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    CustomButton(
                        buttonText:
                            AppLocalizations.of(context)?.add_to_cart ?? '',
                        onTap: () {},
                        width: 250.w,
                        height: 60.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
