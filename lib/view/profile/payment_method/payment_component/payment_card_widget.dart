import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/model/payment_card_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../generated/assets/icons.dart';
import 'card_holder_info_widget.dart';

class PaymentCardWidget extends StatelessWidget {
  final PaymentCardModel cardModel;
  final String? expDate;
  final bool isShowPayment;
  final bool isSelected;
  const PaymentCardWidget(
      {Key? key,
      required this.cardModel,
      this.expDate,
      this.isShowPayment = false,
      this.isSelected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cardLast4Digit = cardModel.number?.substring(
        (cardModel.number!.length - 4).clamp(0, cardModel.number!.length));
    var hideCardNumber = "**** **** **** $cardLast4Digit";
    final theme = Theme.of(context);
    return Container(
      height: 180.h,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected
            ? theme.primaryColor.withOpacity(.8)
            : theme.primaryColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AssetsIcon.visaIcon,
            width: 50.w,
            height: 16,
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            isShowPayment ? hideCardNumber : cardModel.number ?? '',
            style: theme.textTheme.labelLarge?.copyWith(fontSize: 20.sp),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardHolderInfoWidget(
                  title: AppLocalizations.of(context)?.card_holder_name ?? '',
                  subTitle: cardModel.name ?? ''),
              CardHolderInfoWidget(
                  title: AppLocalizations.of(context)?.expiry_date ?? '',
                  subTitle: expDate ?? '')
            ],
          ),
        ],
      ),
    );
  }
}
