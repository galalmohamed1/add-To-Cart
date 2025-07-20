import 'package:add_to_cart/core/network/api_error_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartUpdatedState extends CartState {}

class CartItemAddedState extends CartState {}

class CartItemRemovedState extends CartState {}

class CartClearedState extends CartState {}

class CartErrorState extends CartState {
  ApiErrorModel message;
  CartErrorState(this.message);
}
