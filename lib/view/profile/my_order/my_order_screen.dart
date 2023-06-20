import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/view/profile/my_order/my_order_components/canceled_order.dart';
import 'package:furniture_shopping_flutter/view/profile/my_order/my_order_components/delivered_order.dart';
import 'package:furniture_shopping_flutter/view/profile/my_order/my_order_components/processing_order.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.primaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.my_order_app_bar_title ?? '',
          style: theme.textTheme.displayMedium!.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Column(
        children: [
          /// tab bar portion
          SizedBox(
            height: 50.h,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              unselectedLabelStyle:
                  theme.textTheme.bodyLarge!.copyWith(fontSize: 18.sp),
              labelStyle: theme.textTheme.displayMedium!.copyWith(
                fontSize: 18.sp,
              ),
              indicatorColor: theme.primaryColor,
              unselectedLabelColor: theme.hintColor,
              labelColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0.w),
                insets: EdgeInsets.symmetric(horizontal: 20.w),
              ),
              tabs: [
                Text(
                  AppLocalizations.of(context)
                          ?.my_order_delivered_tab_bar_text ??
                      '',
                ),
                Text(
                  AppLocalizations.of(context)
                          ?.my_order_processing_tab_bar_text ??
                      '',
                ),
                Text(
                  AppLocalizations.of(context)
                          ?.my_order_canceled_tab_bar_text ??
                      '',
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),

          /// tab bar view portion
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                DeliveredOrder(theme: theme),
                ProcessingOrder(theme: theme),
                CanceledOrder(theme: theme),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
