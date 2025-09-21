import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commercenti/feature/home/data/repo/data_source/home_data_source_contract.dart';
import 'package:e_commercenti/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:e_commercenti/feature/home/data/repo/repository/home_repository_contract.dart';

class HomeRepositoryImp implements HomeRepositoryContract {
  const HomeRepositoryImp(this._dataSource);
  final HomeDataSourceContract _dataSource;
  @override
  Future<NetworkResult<List<CategoryResponseDto>>> getCategories() =>
      _dataSource.getCategories();

  @override
  Future<NetworkResult<List<ProductResponseDto>>> getProducts() =>
      _dataSource.getProducts();

}

HomeRepositoryContract injectHomeRepository() =>
    HomeRepositoryImp(injectHomeDataSource());
