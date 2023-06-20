import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/provider/payment_method_provider.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:furniture_shopping_flutter/services/payment_method_service.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/payment_component/payment_card_widget.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/payment_component/selected_payment_checkbox.dart';
import 'package:provider/provider.dart';

class ShowPaymentScreen extends StatefulWidget {
  const ShowPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ShowPaymentScreen> createState() => _ShowPaymentScreenState();
}

class _ShowPaymentScreenState extends State<ShowPaymentScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      PaymentMethodService().getPaymentCardData(context);
    });
  }

  bool selectedMethod = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final paymentProvider = Provider.of<PaymentMethodProvider>(context);
    final paymentCardList =
        Provider.of<PaymentMethodProvider>(context, listen: true)
            .paymentCardList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.primaryColor,
            size: 18.w,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocalizations.of(context)?.show_payment_title ?? '',
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 16.sp),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, addPaymentRoute);
        },
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 30,
        child: Icon(
          Icons.add,
          color: theme.primaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: paymentCardList.isEmpty
            ? Center(
                child: Text(
                  "payment card data is empty",
                  style: theme.textTheme.bodySmall,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: paymentCardList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: PaymentCardWidget(
                                  cardModel: paymentCardList[index],
                                  isSelected:
                                      paymentCardList[index].isSelected ??
                                          false,
                                  isShowPayment: true,
                                  expDate:
                                      "${paymentCardList[index].expMonth}/${paymentCardList[index].expYear}",
                                ),
                              ),
                              SelectedPaymentCheckBox(
                                  index: index,
                                  onChange: (value) {
                                    paymentProvider.setPaymentCard(
                                        index, value);
                                  }),
                            ],
                          );
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
