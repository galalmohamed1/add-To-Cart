class ProductDataModel {
  final String image;
  final String name;
  final String price;
  final String description;

  ProductDataModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      image: json['image'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }
}