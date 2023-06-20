import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/model/payment_card_model.dart';

class PaymentMethodProvider with ChangeNotifier{
  List<PaymentCardModel> paymentCardList = [];
  PaymentCardModel? selectedPaymentCard;

  ///this method is used to clear previous list of payment card data
  clearPaymentList(){
    paymentCardList.clear();
    notifyListeners();
  }

  /// this method is used to update list of payment card info that we access from firebase
  getCardDataProvider(List<PaymentCardModel> cardList) async{
    paymentCardList = cardList;
    notifyListeners();
  }

  /// this method is used to set selected payment card
  setPaymentCard(int index,bool? value){
    for(int i = 0 ; i< paymentCardList.length ; i++){
      paymentCardList[i].isSelected = false;
    }
    selectedPaymentCard = paymentCardList[index];
    selectedPaymentCard?.isSelected = value;
    notifyListeners();
  }
}
