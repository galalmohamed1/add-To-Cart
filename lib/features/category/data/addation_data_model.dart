class AddationDataModel {
  int? id;
  String? name;
  double? price;
  String? image;
  num? count=0;

  AddationDataModel({this.id, this.name, this.price, this.image, this.count =0});

  AddationDataModel.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    price = double.tryParse(json['price'].toString());
    image = json['image'];
  }
}