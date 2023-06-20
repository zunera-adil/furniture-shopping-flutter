import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';



loadingDialogue(BuildContext context){
  final theme = Theme.of(context);
  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (c) {
        return AlertDialog(
          backgroundColor: theme.scaffoldBackgroundColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          contentPadding:  EdgeInsets.all(25.w),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:  RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.r))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                child:  CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

