import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/assets/images.dart';
import 'custom_social_login_button.dart';

class SocialButtonsWidget extends StatelessWidget {
  final bool? isBorderRequired;
  const SocialButtonsWidget({
    Key? key,
    this.isBorderRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          imageUrl: AssetsImages.facebookIcon,
          onTap: () {},
          isBorder: isBorderRequired,
        ),
        SizedBox(
          width: 28.w,
        ),
        SocialButton(
          imageUrl: AssetsImages.googleIcon,
          onTap: () {},
          isBorder: isBorderRequired,
        )
      ],
    );
  }
}
