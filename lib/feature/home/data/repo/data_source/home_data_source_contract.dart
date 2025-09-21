import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';

import '../../model/response/product_response_dto.dart';

abstract  class HomeDataSourceContract{
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories();
  Future<NetworkResult<List<ProductResponseDto>>> getProducts();

 }
