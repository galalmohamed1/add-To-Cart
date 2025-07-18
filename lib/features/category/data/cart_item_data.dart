import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';

class CartItem {
  int? id;
  String? image;
  final String name;
  final double quantity;
  final WeightData selectedWeight;
  final List<AddationDataModel> selectedAdditions;
  final List<ExtrasDataModel> selectedExtras;

  CartItem({
    this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.selectedWeight,
    required this.selectedAdditions,
    required this.selectedExtras,
  });

  
}
