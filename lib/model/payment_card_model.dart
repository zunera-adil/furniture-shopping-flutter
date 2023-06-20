class PaymentCardModel {
  static const cardId = "card_id";
  static const cardNumber = "number";
  static const cardCVV = "cvv";
  static const cardHolderName = "holder_name";
  static const cardMonth = "exp_month";
  static const cardYear = "exp_year";
  String? id;
  String? number;
  String? name;
  String? expMonth;
  String? expYear;
  String? cvv;
  bool? isSelected;

  PaymentCardModel({
    this.id,
    this.number,
    this.name,
    this.expMonth,
    this.expYear,
    this.isSelected = false,
    this.cvv});

  PaymentCardModel.fromMap(Map<String, dynamic> data){
    id = data[cardId];
    name = data[cardHolderName];
    number = data[cardNumber];
    expMonth = data[cardMonth];
    expYear = data[cardYear];
    cvv =  data[cardCVV];
  }
}