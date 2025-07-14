class ExtrasDataModel {
  int? id;
  String? name;
  double? price;
  bool check=false;

  ExtrasDataModel({this.id, this.name, this.price, this.check = false});


  factory ExtrasDataModel.fromJson({required Map<String, dynamic> json}) {
    return ExtrasDataModel(
      id: json['id'],
      name: json['name'],
      price: double.tryParse(json['price'].toString()),
      
    );
  } 

}