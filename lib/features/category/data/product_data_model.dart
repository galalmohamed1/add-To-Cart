class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  bool? isSingle;
  double? price;
  double? priceBeforeDiscount;
  int? points;
  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.isSingle,
      this.price,
      this.priceBeforeDiscount,
      this.points});

  ProductModel.fromJson({required Map<String, dynamic> json}) {
    
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    isSingle = json['is_single'];
    price = double.tryParse(json['price'].toString());
    priceBeforeDiscount = double.tryParse(json['price_before_discount'].toString());
    points = json['points'];
  }

}
