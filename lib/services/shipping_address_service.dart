import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import '../components/loading_dialogue.dart';
import '../model/shipping_address_model.dart';

CollectionReference shippingAddress =
    FirebaseFirestore.instance.collection('shipping address');

void showSnackBar(String value, context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(value),
    backgroundColor: color,
  ));
}

class ShippingAddressService {


  Future<List<ShippingAddressModel>> getShippingAddressData() async{
    List<ShippingAddressModel> shippingAddressList = [];
    await shippingAddress.get().then((value) {
      for (var item in value.docs) {
        shippingAddressList.add(ShippingAddressModel.fromMap(item.data() as Map<String, dynamic>));
      }
    }).catchError((e){
    });
    return shippingAddressList;
  }

  Future<void> addShippingAddress(
      ShippingAddressModel model, BuildContext context) async {
    loadingDialogue(context);
    String docId = shippingAddress.doc().id;
    await shippingAddress.doc(docId).set({
      ShippingAddressModel.shoppingAdressId: docId,
      ShippingAddressModel.fullName: model.nameField,
      ShippingAddressModel.shippingAddress: model.addressField,
      ShippingAddressModel.postalCode: model.postalCodeField,
      ShippingAddressModel.country: model.countryField,
      ShippingAddressModel.city: model.cityField,
      ShippingAddressModel.district: model.districtField
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Future.delayed(Duration.zero, () {
        showSnackBar(
            'Data has been saved successfully', context, kSystemGreenColor);
      });
    }).catchError((e) {
      showSnackBar('Data is failed to save', context, kSystemRedColor);
    });
  }
}
