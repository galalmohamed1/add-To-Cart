class ExtrasDataModel {
  final String name;
  final String price;
  bool check;

  ExtrasDataModel({
    required this.name,
    required this.price,
    this.check =true,
  });


  factory ExtrasDataModel.fromJson(Map<String, dynamic> json) {
    return ExtrasDataModel(
      name: json['name'],
      price: json['price'],
      check: json['check'],
    );
  } 

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'check':check,
    };
  }
}