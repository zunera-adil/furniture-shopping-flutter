import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/provider/payment_method_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectedPaymentCheckBox extends StatelessWidget {
  final int index;
  final Function onChange;
  const SelectedPaymentCheckBox(
      {Key? key, required this.index, required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentMethodProvider>(context);
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.h,
          height: 20.h,
          child: Checkbox(
              value: paymentProvider.paymentCardList[index].isSelected ?? false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) => onChange(value)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          AppLocalizations.of(context)?.default_payment_method_text ?? '',
          style: theme.textTheme.bodySmall,
        )
      ],
    );
  }
}
