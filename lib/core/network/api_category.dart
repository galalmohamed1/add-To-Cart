import 'dart:convert';
import 'dart:developer';
import 'package:add_to_cart/core/network/constants.dart';
import 'package:add_to_cart/core/network/endpoint.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:http/http.dart' as http;

class ApiCategory {

  static Future<List<Prodect>> fetchCategory() async {

    final url = Uri.https(
        Constants.baseUrl,
        Endpoint.endpointCategory,
      );

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept-Language': 'en',
        },
      );

       log(response.request.toString());
       log(response.body.toString());
        
        ProductDataModel? productdata;
        final data= jsonDecode(response.body);
      if (response.statusCode == 200) {
         productdata= ProductDataModel.fromJson(data);
      }
      
      return productdata!.prodect;

    } catch (error) {
      print('Error occurred: $error');
      return throw Exception(error.toString());
    }
  }
}
