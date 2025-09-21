import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/api/home_api.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';
import 'package:e_commercenti/feature/home/domain/repo/data_source/home_data_source_contract.dart';

class HomeDataSourceImp implements HomeDataSourceContract {
  HomeDataSourceImp(this._api);

  final HomeApi _api;

  @override
  Future<NetworkResult<List<CategoryEntity>>> getCategories() async {
    final result = await _api.getCategories();
    switch (result) {
      case NetworkSuccess <List<CategoryResponseDto>>():
        return NetworkSuccess<List<CategoryEntity>>
          (result.data.map((element) => element.toEntity()).toList());

      case NetworkError<List<CategoryResponseDto>>():
        return NetworkError(result.message);
    }
  }

  @override
  Future<NetworkResult<List<ProductEntity>>> getProducts() async {
    final result = await _api.getProducts();
    switch (result) {
      case NetworkSuccess<List<ProductResponseDto>>():
        return NetworkSuccess<List<ProductEntity>>(
            result.data.map((element) => element.toEntity()).toList());
      case NetworkError<List<ProductResponseDto>>():
        return NetworkError<List<ProductEntity>>(result.message);
    }
  }

}
HomeDataSourceContract injectHomeDataSource() => HomeDataSourceImp(HomeApi.instance); 