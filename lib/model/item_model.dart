class ItemModel {
  String? itemName;
  List<String>? image;
  double? price;
  double? rating;
  int? totalReviews;
  String? date;
  String? description;

  ItemModel(
      {this.image,
      this.itemName,
      this.price,
      this.rating,
      this.totalReviews,
      this.description,
      this.date});
}
