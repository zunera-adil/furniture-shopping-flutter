import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/components/custom_snackbar.dart';
import 'package:furniture_shopping_flutter/components/loading_dialogue.dart';
import 'package:furniture_shopping_flutter/model/payment_card_model.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import 'package:provider/provider.dart';
import '../provider/payment_method_provider.dart';

class PaymentMethodService {
  CollectionReference paymentCardReference =
      FirebaseFirestore.instance.collection('payment_card_info');

  /// this function is used to get payment info from firebase
  Future<void> getPaymentCardData(BuildContext context) async {
    Provider.of<PaymentMethodProvider>(context, listen: false)
        .clearPaymentList();
    loadingDialogue(context);
    List<PaymentCardModel> paymentCard = [];
    await paymentCardReference.get().then((value) {
      for (var item in value.docs) {
        paymentCard
            .add(PaymentCardModel.fromMap(item.data() as Map<String, dynamic>));
      }
      Provider.of<PaymentMethodProvider>(context, listen: false)
          .getCardDataProvider(paymentCard);
      Navigator.of(context).pop();
    }).catchError((e) {
      Navigator.of(context).pop();
      showSnackBar(
        message: e.toString(),
        context: context,
        backGroundColor: Theme.of(context).colorScheme.error,
      );
    });
  }

  ///this function is used to add payment card info data into firebase
  Future<void> addPaymentCardData(
      PaymentCardModel paymentCardModel, BuildContext context) async {
    loadingDialogue(context);
    String docId = paymentCardReference.doc().id;
    await paymentCardReference.doc(docId).set({
      PaymentCardModel.cardId: docId,
      PaymentCardModel.cardHolderName: paymentCardModel.name,
      PaymentCardModel.cardNumber: paymentCardModel.number,
      PaymentCardModel.cardCVV: paymentCardModel.cvv,
      PaymentCardModel.cardMonth: paymentCardModel.expMonth,
      PaymentCardModel.cardYear: paymentCardModel.expYear,
      "publish_date": DateTime.now()
    }).then((value) async {
      await PaymentMethodService().getPaymentCardData(context).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackBar(
          message: "Payment card info data saved successfully",
          context: context,
          backGroundColor: kSystemGreenColor,
        );
      });
    }).catchError((e) {
      Navigator.of(context).pop();
      showSnackBar(
        message: e.toString(),
        context: context,
        backGroundColor: Theme.of(context).colorScheme.error,
      );
    });
  }
}
