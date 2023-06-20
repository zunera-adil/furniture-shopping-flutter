import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/model/shipping_address_model.dart';
import 'package:furniture_shopping_flutter/services/shipping_address_service.dart';


class ShippingAddressProvider with ChangeNotifier{
  List<ShippingAddressModel> shippingAddressList = [];
  bool isLoading = false;
  bool _isShippingAddressChecked = false;
  get isShippingAddressChecked => _isShippingAddressChecked;

  void setIsShippingAddressChecked(bool value){
    _isShippingAddressChecked = value;
    notifyListeners();
  }


  getShippingData() async{
    isLoading = true;
    notifyListeners();
    await ShippingAddressService().getShippingAddressData().then((value) {
      if(value.isNotEmpty){
        shippingAddressList = value;
        isLoading = false;
        notifyListeners();
      }
    });
  }
}