import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';


abstract  class HomeDataSourceContract{
  Future<NetworkResult<List<CategoryEntity >>> getCategories();
  Future<NetworkResult<List<ProductEntity>>> getProducts();

 }
