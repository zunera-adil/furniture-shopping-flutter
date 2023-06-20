import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/view/profile/my_order/common_components/common_component.dart';

class DeliveredOrder extends StatelessWidget {
  final ThemeData theme;

  const DeliveredOrder({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return OrderInfoBox(theme: theme, orderStatus: 'Delivered');
      },
      itemCount: 10,
    );
  }
}