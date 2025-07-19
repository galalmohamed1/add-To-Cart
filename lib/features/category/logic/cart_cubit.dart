import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<HomeStates> {
  CartCubit() : super(HomeInitialState());
  double price=0.0;
  CartItem? _item;
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
  }

  void removeItem(int id) {
    _cartItems.indexWhere((item) => item.id == id);
  }


  void clearCart() {
    _cartItems.clear();
  }

  double calculatePrice() {
    final weightPrice = _item!.selectedWeight.price ?? 0;
  final additionPrice = _item!.additionsPrice ?? 0;
  final extrasPrice = _item!.extrasPrice ?? 0;

  return weightPrice + additionPrice + extrasPrice;
  }
}