import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';

class CartItem {
  ProductModel? product;
  int? id;
  String? image;
  final String name;
  final double quantity;
  final WeightData selectedWeight;
  final String selectedAdditions;
  final String selectedExtras;
  final num? extrasPrice;
  final num? additionsPrice;

  CartItem({
    this.additionsPrice,
    this.extrasPrice, 
    this.product,
    this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.selectedWeight,
    required this.selectedAdditions,
    required this.selectedExtras,
  });

  
}
