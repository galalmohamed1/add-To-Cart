class ProductDataModel {
  final String message;
  final List<Prodect> prodect;

  ProductDataModel({
    required this.message,
    required this.prodect,
  });

  factory ProductDataModel.fromJson(Map<String,dynamic> json) =>ProductDataModel(
      message: json["message"],
      prodect: List.from(json["products"]).map(
            (e) => Prodect.fromJson(e),
      ).toList(),
  );
}
class Prodect{
  final String id;
  final String name;
  final String description;
  final String image;
  final String isSingle;
  final String price;
  final String price_before_discount;
  final String points;

  Prodect({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isSingle,
    required this.price_before_discount,
    required this.points, 
  });

  factory Prodect.fromJson(Map<String, dynamic> json) {
    return Prodect(
      id:json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'], 
      price: json['price'],
      isSingle: json['is_single'],
      price_before_discount: json['price_before_discount'],
      points: json['points'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'description':description,
      'image': image,
      'is_single':isSingle,
      'price': price,
      'price_before_discount':price_before_discount,
      'points':points,
    };
  }
}
