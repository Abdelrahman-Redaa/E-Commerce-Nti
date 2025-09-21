 import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/domain/repo/repository/home_repository_contract.dart';
import '../../data/repo/repository/home_repository_imp.dart';
import '../entities/category_entity.dart';

class GetCategoriesUaeCase{
  GetCategoriesUaeCase(this._repo);
  final HomeRepositoryContract _repo;
  Future<NetworkResult<List<CategoryEntity>>> call() => _repo.getCategories();

 }
 GetCategoriesUaeCase injectGetCategoriesUaeCase() =>
     GetCategoriesUaeCase(injectHomeRepository());