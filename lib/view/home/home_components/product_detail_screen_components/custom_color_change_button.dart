import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomColorChangeCircleButton extends StatelessWidget {
  const CustomColorChangeCircleButton({
    Key? key,
    required PageController pageController,
    required this.colors,
    required this.currentIndex,
    required this.index,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final List<Color> colors;
  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _pageController.jumpToPage(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors[index],
          shape: BoxShape.circle,
          border: Border.all(
            color: index == currentIndex
                ? Theme.of(context).hintColor
                : Theme.of(context).indicatorColor,
            width: 4.w, //                   <--- border width here
          ),
        ),
        width: 30.w,
        height: 30.w,
      ),
    );
  }
}
