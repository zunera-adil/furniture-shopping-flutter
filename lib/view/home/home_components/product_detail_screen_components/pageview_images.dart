import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreenPageViewImages extends StatelessWidget {
  final List<String> image;
  final int index;

  const DetailScreenPageViewImages(
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
    );
  }
}
