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

class HomeSuccessExtraState extends HomeStates {
  List<ExtrasDataModel> extras;
  HomeSuccessExtraState(this.extras);
}

class HomeSuccessWeightState extends HomeStates {
  List<WeightData> weights;
  HomeSuccessWeightState(this.weights);
}

class HomeSuccessSaladsState extends HomeStates {
  List<AddationDataModel> salads;
  HomeSuccessSaladsState(this.salads);
}
class CartUpdatedState extends HomeStates {
  CartUpdatedState();
}

class HomeErrorState extends HomeStates {
  final ApiErrorModel error;
  HomeErrorState(this.error);
}
