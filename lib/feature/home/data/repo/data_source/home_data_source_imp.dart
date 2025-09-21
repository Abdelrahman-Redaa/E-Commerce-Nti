import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/api/home_api.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commercenti/feature/home/data/repo/data_source/home_data_source_contract.dart';

class HomeDataSourceImp implements HomeDataSourceContract {
  HomeDataSourceImp(this._api);
  final HomeApi _api;
  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() =>
      _api.getCategories();

  @override
  Future<NetworkResult<List<ProductResponseDto>>> getProducts() =>
      _api.getProducts();


}
HomeDataSourceContract injectHomeDataSource() => HomeDataSourceImp(HomeApi.instance); 