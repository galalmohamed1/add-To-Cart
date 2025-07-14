
import 'dart:convert';

import 'package:add_to_cart/core/network/api_category.dart';
import 'package:add_to_cart/core/network/api_error_model.dart';
import 'package:add_to_cart/core/network/constants.dart';
import 'package:add_to_cart/core/network/endpoint.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/category_screen.dart';
import 'package:add_to_cart/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeCubit extends Cubit<HomeStates> {
  
  HomeCubit(): super(HomeInitialState());

  @override
  void emit(HomeStates state) {
    if (isClosed) return;
    super.emit(state);
  }

  List<Widget> layoutScreens = [AddToCart() ,];
  List<ProductModel> _prodects = [];

  void getCategoriesData() async {
    emit(HomeLoadingState());
  try {
    final response = await Dio().get(
      'https://www.trendapp.org/test-project/public/api/singleCategory/11',
      options: Options(
        headers: {
          'Accept-Language': 'en',
        },
      ),
    );

    if (response.statusCode!< 400) {
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
    }
  
}
List<ExtrasDataModel> _extras= [];
void getProdectDataExtras() async {
    emit(HomeLoadingState());
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
  try {
    final response = await dio.get(
      "https://www.trendapp.org/test-project/public/api/productDetails/60",
      options: Options(
        headers: {
          'Accept-Language': 'en',
        },
      ),
    );

    if (response.statusCode!< 400) {
      final responseBody = response.data;

      for (var item in responseBody['data']['extra_items']) {
        _extras.add(ExtrasDataModel.fromJson(json: item));
      }

      emit(HomeSuccessExtraState(_extras));
    } else {
      final responseBody = response.data;
      emit(HomeErrorState(responseBody['message'] ?? 'Unknown error'));
    }
  } catch (error) {
      print('Internet check failed: $error');
      emit(HomeErrorState(ApiErrorModel(message: 'Something')));
    }
  
}
List<WeightData> _weights = [];
void getProdectDataWeights() async {
    emit(HomeLoadingState());
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
  try {
    final response = await dio.get(
      "https://www.trendapp.org/test-project/public/api/productDetails/60",
      options: Options(
        headers: {
          'Accept-Language': 'en',
        },
      ),
    );

    if (response.statusCode!< 400) {
      final responseBody = response.data;

      for (var item in responseBody['data']['weights']) {
        _weights.add(WeightData.fromJson(json: item));
      }

      emit(HomeSuccessWeightState(_weights));
    } else {
      final responseBody = response.data;
      emit(HomeErrorState(responseBody['message'] ?? 'Unknown error'));
    }
  } catch (error) {
      print('Internet check failed: $error');
      emit(HomeErrorState(ApiErrorModel(message: 'Something')));
    }
  
}

List<AddationDataModel> _salads = [];
void getProdectDataSalads() async {
    emit(HomeLoadingState());
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
  try {
    final response = await dio.get(
      "https://www.trendapp.org/test-project/public/api/productDetails/60",
      options: Options(
        headers: {
          'Accept-Language': 'en',
        },
      ),
    );

    if (response.statusCode!< 400) {
      final responseBody = response.data;

      for (var item in responseBody['data']['salads']) {
        _salads.add(AddationDataModel.fromJson(json: item));
      }

      emit(HomeSuccessSaladsState(_salads));
    } else {
      final responseBody = response.data;
      emit(HomeErrorState(responseBody['message'] ?? 'Unknown error'));
    }
  } catch (error) {
      print('Internet check failed: $error');
      emit(HomeErrorState(ApiErrorModel(message: 'Something')));
    }
  
}

List<CartItem> cart = [];

void addToCart(CartItem item) {
  cart.add(item);
  emit(CartUpdatedState());
}
}
  

