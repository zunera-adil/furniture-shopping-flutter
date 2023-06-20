import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreenProvider extends ChangeNotifier {
  bool _isNotifySales = false;
  bool _isNotifyNewArrivals = false;
  bool _isNotifyDeliveryStatus = false;

  bool get isNotifySales => _isNotifySales;
  bool get isNotifyNewArrivals => _isNotifyNewArrivals;
  bool get isNotifyDeliveryStatus => _isNotifyDeliveryStatus;
  void toggleNotification(int num, bool value) {
    switch (num) {
      case 0:
        _isNotifySales = value;
        notifyListeners();
        break;
      case 1:
        _isNotifyNewArrivals = value;
        notifyListeners();
        break;
      case 2:
        _isNotifyDeliveryStatus = value;
        notifyListeners();
        break;
    }
  }
}
