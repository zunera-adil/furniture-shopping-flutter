import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryTabBar extends StatelessWidget {
  final String imgUrl;
  final String text;
  final int selectedIndex;
  final int index;
  const HomeCategoryTabBar({
    Key? key,
    required this.imgUrl,
    required this.text,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 70.h,
      child: Column(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: selectedIndex == index
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).indicatorColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(imgUrl),
            ),
          ),
          Text(
            text,
            style: selectedIndex == index
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).primaryColor)
                : Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
