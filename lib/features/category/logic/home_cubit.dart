import 'package:add_to_cart/core/network/api_error_model.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/category_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  List<ProductModel> _prodects = [];
  // List<CartItem> cart = [];
  List<AddationDataModel> _salads = [];

  List<WeightData> _weights = [];
  List<Widget> layoutScreens = [const AddToCart()];
  List<ExtrasDataModel> _extras = [];

  List<WeightData> get weights => _weights;
  List<AddationDataModel> get salads => _salads;
  List<ExtrasDataModel> get extras => _extras;

  @override
  void emit(HomeStates state) {
    if (isClosed) return;
    super.emit(state);
  }

  void getCategoriesData() async {
    emit(HomeLoadingState());
    try {
      final response = await Dio().get(
        'https://www.trendapp.org/test-project/public/api/singleCategory/11',
        options: Options(headers: {'Accept-Language': 'en'}),
      );

      if (response.statusCode! < 400) {
        final responseBody = response.data;

        for (var item in responseBody['data']['products']) {
          _prodects.add(ProductModel.fromJson(json: item));
        }

        emit(HomeSuccessState(_prodects));
      } else {
        final responseBody = response.data;
        emit(HomeErrorState(responseBody['message'] ?? 'Unknown error'));
      }
    } catch (error) {
      print('Internet check failed: $error');
      emit(HomeErrorState(ApiErrorModel(message: 'Something')));
      rethrow;
    }
  }

  void getProductData(int id) async {
    print('getProductData called with id: $id');
    _salads.clear();
    _weights.clear();
    _extras.clear();
    emit(
      HomeProductState(
        state: ProductState.loading,
        product: ProductModel(),
        weights: [],
        additions: [],
        extras: [],
      ),
    );
    final dio = Dio()
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          filter: (options, args) {
            //  return !options.uri.path.contains('posts');
            return !args.isResponse || !args.hasUint8ListData;
          },
        ),
      );
    // try {
    final response = await dio.get(
      "https://www.trendapp.org/test-project/public/api/productDetails/$id",
      options: Options(headers: {'Accept-Language': 'en'}),
    );

    if (response.statusCode! < 400) {
      final responseBody = response.data;
      if (responseBody['data']['extra_items'] is List) {
        for (var item in responseBody['data']['extra_items']) {
          _extras.add(ExtrasDataModel.fromJson(json: item));
        }
      }
      if (responseBody['data']['weights'] is List) {
        for (var item in responseBody['data']['weights']) {
          _weights.add(WeightData.fromJson(json: item));
        }
      }
      if (responseBody['data']['salads'] is List) {
        for (var item in responseBody['data']['salads']) {
          _salads.add(AddationDataModel.fromJson(json: item));
        }
      }
      emit(
        HomeProductState(
          state: ProductState.success,
          product: ProductModel.fromJson(json: responseBody['data']),
          weights: _weights,
          additions: _salads,
          extras: _extras,
        ),
      );
    } else {
      emit(
        HomeProductState(
          errorMessage: response.data['message'] ?? 'Unknown error',
          state: ProductState.error,
          product: ProductModel(),
          weights: [],
          additions: [],
          extras: [],
        ),
      );
    }
    // } catch (error) {
    //   print('Internet check failed: $error');
    //   emit(HomeProductState(errorMessage: error.toString(), state: ProductState.error, product: ProductModel(), weights: [], additions: [], extras: []));
    //   rethrow;
    // }
  }


  // void addToCart(CartItem item) {
  //   cart.add(item);
  //   emit(AddToCartState());
  // }
}
