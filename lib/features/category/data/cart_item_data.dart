import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';

class CartItem{
  final ProductModel product;
  final int quantity;
  final WeightData? weight;
  final Map<AddationDataModel, int> additions;
  final List<ExtrasDataModel> extras;

  CartItem({
    required this.product,
    required this.quantity,
    required this.weight,
    required this.additions,
    required this.extras,
  });
}