import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';
import 'package:e_commercenti/feature/home/domain/repo/data_source/home_data_source_contract.dart';
import 'package:e_commercenti/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:e_commercenti/feature/home/domain/repo/repository/home_repository_contract.dart';

class HomeRepositoryImp implements HomeRepositoryContract {
  const HomeRepositoryImp(this._dataSource);
  final HomeDataSourceContract _dataSource;

  @override
  Future<NetworkResult<List<CategoryEntity>>> getCategories() =>
      _dataSource.getCategories();

  @override
  Future<NetworkResult<List<ProductEntity>>> getProducts() =>
      _dataSource.getProducts();
}

HomeRepositoryContract injectHomeRepository() =>
    HomeRepositoryImp(injectHomeDataSource());
