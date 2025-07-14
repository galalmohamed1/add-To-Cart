class WeightData {
  int? id;
  String? name;
  double? price;
  int? points;
  int? priceBeforeDiscount;
  int? numberOfSalad;

  WeightData(
      {this.id,
      this.name,
      this.price,
      this.points,
      this.priceBeforeDiscount,
      this.numberOfSalad});

  WeightData.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    price = double.tryParse(json['price'].toString());
    points = json['points'];
    priceBeforeDiscount = json['price_before_discount'];
    numberOfSalad = json['number_of_salad'];
  }

}