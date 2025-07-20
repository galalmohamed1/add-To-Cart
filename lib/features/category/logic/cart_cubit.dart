import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/logic/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    emit(CartItemAddedState());
  }

  void removeItem(int id) {
    _cartItems.removeWhere((item) => item.id == id);
    emit(CartItemRemovedState());
  }

  void clearCart() {
    _cartItems.clear();
    emit(CartClearedState());
  }

  void updateItem(CartItem newItem) {
    final index = _cartItems.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      _cartItems[index] = newItem;
      emit(CartUpdatedState());
    }
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      final weightPrice = item.selectedWeight.price ?? 0;
      final additionPrice = item.additionsPrice ?? 0;
      final extrasPrice = item.extrasPrice ?? 0;
      total += weightPrice + additionPrice + extrasPrice;
    }
    return total;
  }
}
