import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/view/home/home_components/product_detail_screen_components/custom_slider_indicator.dart';
import 'package:furniture_shopping_flutter/view/home/home_components/product_detail_screen_components/pageview_images.dart';
import '../../../../components/custom_back_button.dart';
import '../../../../model/item_model.dart';
import '../../../../utills/colors.dart';
import 'custom_color_change_button.dart';
class DetailTopWidget extends StatefulWidget {
  const DetailTopWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<DetailTopWidget> createState() => _DetailTopWidgetState();
}

class _DetailTopWidgetState extends State<DetailTopWidget> {
  int currentIndex = 0;
  final PageController _pageController = PageController(keepPage: true);
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Theme.of(context).scaffoldBackgroundColor,
      kSecondaryBrownColor,
      kSecondarySkinColor
    ];
    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(
        height: 445.h,
        width: 323.w,
        child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.item.image?.length ?? 0,
            onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
            itemBuilder: (context, index) {
              return DetailScreenPageViewImages(
                image: widget.item.image ?? [],
                index: index,
              );
            }),
      ),
      Positioned(
        top: 53.h,
        left: -22.w,
        child: const BackArrowIconButton(),
      ),
      Positioned(
        top: 137.h,
        left: -30.w,
        child: Container(
          height: 204.h,
          width: 64.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(0.5),
                spreadRadius: 4.r,
                blurRadius: 40.r, // changes position of shadow
              ),
            ],
          ),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: colors.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return CustomColorChangeCircleButton(
                pageController: _pageController,
                colors: colors,
                currentIndex: currentIndex,
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 24.h,
              );
            },
          ),
        ),
      ),
      Positioned(
          bottom: 20.h,
          right: 50.w,
          child: DetailScreenSliderIndicator(index: currentIndex))
    ]);
  }
}
