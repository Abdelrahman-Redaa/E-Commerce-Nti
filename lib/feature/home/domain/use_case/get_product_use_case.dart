import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/repo/repository/home_repository_imp.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';
import 'package:e_commercenti/feature/home/domain/repo/repository/home_repository_contract.dart';

class GetProductUseCase {
  GetProductUseCase(this._repo);
  final HomeRepositoryContract _repo;
  Future<NetworkResult<List<ProductEntity>>> call() => _repo.getProducts();
}

GetProductUseCase injectGetProductUseCase() =>
    GetProductUseCase(injectHomeRepository());
