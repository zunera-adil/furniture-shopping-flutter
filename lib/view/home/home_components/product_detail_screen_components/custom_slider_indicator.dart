import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';

class DetailScreenSliderIndicatorWithBackgroundImage extends StatelessWidget {
  final List<String> image;
  final int index;

  const DetailScreenSliderIndicatorWithBackgroundImage(
      {Key? key, required this.image, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r)),
          image: DecorationImage(
              image: AssetImage(
                image[index],
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 337.h, right: 50.w),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                3,
                    (currentIndex) =>
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: index == currentIndex ? 30.w : 15.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: index == currentIndex
                              ? Theme
                              .of(context)
                              .primaryColor
                              : Theme
                              .of(context)
                              .scaffoldBackgroundColor),
                    ),
              )),
        ));
  }
}

class DetailScreenSliderIndicator extends StatelessWidget {
  const DetailScreenSliderIndicator({
    Key? key,
    required this.index,
    this.item,
  }) : super(key: key);

  final int index;
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(
          item?.image?.length ?? 3,
          (currentIndex) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            width: index == currentIndex ? 30.w : 15.w,
            height: 4.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: index == currentIndex
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).scaffoldBackgroundColor),
          ),
        ));
  }
}
