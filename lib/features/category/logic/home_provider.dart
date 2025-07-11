
import 'package:add_to_cart/core/network/api_category.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
int _selectedIndex = 0;
  ProductDataModel? _selectedCategory;
  List<Prodect> _prodectList = [];

  int get selectedIndex => _selectedIndex;

  List<Prodect> get prodectList => _prodectList;
  // ProductDataModel get prodectdata =>_selectedCategory!;
  void countCategory(ProductDataModel selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }


  Future<bool> getAllSources() async {
    try {
      _prodectList = await ApiCategory.fetchCategory();
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

}
