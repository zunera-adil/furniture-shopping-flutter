class ShippingAddressModel {
  static const shoppingAdressId = "id";
  static const fullName = "name";
  static const shippingAddress = "address";
  static const postalCode = "postal_code";
  static const country = "country";
  static const city = "city";
  static const district = "district";
  String? id;
  String? nameField;
  String? addressField;
  String? postalCodeField;
  String? countryField;
  String? cityField;
  bool? isSelected;
  String? districtField;

  ShippingAddressModel(
      {this.id,
      this.nameField,
      this.addressField,
      this.postalCodeField,
      this.countryField,
      this.cityField,
      this.isSelected = false,
      this.districtField});

  ShippingAddressModel.fromMap(Map<String, dynamic> data) {
    id = data[shoppingAdressId];
    nameField = data[fullName];
    addressField = data[shippingAddress];
    postalCodeField = data[postalCode];
    countryField = data[country];
    cityField = data[city];
    districtField = data[district];
  }
}
