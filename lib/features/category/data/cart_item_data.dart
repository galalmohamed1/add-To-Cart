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

  CartItem copyWith({
    ProductModel? product,
    int? id,
    String? image,
    String? name,
    double? quantity,
    WeightData? selectedWeight,
    String? selectedAdditions,
    String? selectedExtras,
    num? extrasPrice,
    num? additionsPrice,
  }) {
    return CartItem(
      product: product ?? this.product,
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      selectedWeight: selectedWeight ?? this.selectedWeight,
      selectedAdditions: selectedAdditions ?? this.selectedAdditions,
      selectedExtras: selectedExtras ?? this.selectedExtras,
      extrasPrice: extrasPrice ?? this.extrasPrice,
      additionsPrice: additionsPrice ?? this.additionsPrice,
    );
  }
}

