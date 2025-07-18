import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<HomeStates> {
  CartCubit() : super(HomeInitialState());

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    // emit(CartUpdated(List.from(_cartItems)));
  }

  void removeItem(int id) {
    // _cartItems.removeWhere((item) => item.product.id == id);
    // emit(CartUpdated(List.from(_cartItems)));
  }

  void clearCart() {
    _cartItems.clear();
    // emit(CartUpdated(List.from(_cartItems)));
  }
}