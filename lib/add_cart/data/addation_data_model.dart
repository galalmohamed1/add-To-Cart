class AddationDataModel {
  final String image;
  final String name;
  final String price;

  AddationDataModel({
    required this.image,
    required this.name,
    required this.price,
  });
  factory AddationDataModel.fromJson(Map<String, dynamic> json) {
    return AddationDataModel(
      image: json['image'],
      name: json['name'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
    };
  }
}