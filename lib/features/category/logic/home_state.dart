import 'package:add_to_cart/core/network/api_error_model.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}


class HomeSuccessState extends HomeStates {
  List<ProductModel> products;
  HomeSuccessState(this.products);
}

class HomeErrorState extends HomeStates {
  ApiErrorModel message;
  HomeErrorState(this.message);
}

enum ProductState { initial, loading, success, error }

class HomeProductState extends HomeStates {
  final ProductState state;
  final String? errorMessage;
  final ProductModel product;
  final List<WeightData> weights;
  final List<AddationDataModel> additions;
  final List<ExtrasDataModel> extras;

  HomeProductState({this.errorMessage, required this.state, required this.product, required this.weights, required this.additions, required this.extras});
}

class AddToCartState extends HomeStates{
 AddToCartState();
}