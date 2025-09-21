import 'dart:convert';

import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:http/http.dart' as http;

import '../model/response/product_response_dto.dart';

class HomeApi {
  HomeApi._();
  static HomeApi? _instance;
  static HomeApi get instance => _instance ??= HomeApi._();
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() async {
    try {
      Uri url = Uri.https("api.escuelajs.co", "/api/v1/categories/");
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      var data = json.map((e) => CategoryResponseDto.fromJson(e)).toList();
      return NetworkSuccess(data);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }

  Future<NetworkResult<List<ProductResponseDto>>> getProducts() async {
    try {
      Uri url = Uri.https("api.escuelajs.co", "/api/v1/products/");
      var response = await http.get(url);
      String responseBody = response.body;
     var json = jsonDecode(responseBody) as List ;
      var listOfProducts = json.map((e) => ProductResponseDto.fromJson(e)).toList();
      return NetworkSuccess(listOfProducts);
    } catch (e) {
      return NetworkError(e.toString());
    }
  }
}
