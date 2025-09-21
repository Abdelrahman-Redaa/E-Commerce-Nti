import 'package:bloc/bloc.dart';
import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';
import 'package:e_commercenti/feature/home/domain/use_case/get_categories_use_case.dart';
import 'package:e_commercenti/feature/home/domain/use_case/get_product_use_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCategoriesUseCase, this._getProductUseCase ) : super(HomeInitial());
  final GetCategoriesUaeCase _getCategoriesUseCase;
  final   GetProductUseCase _getProductUseCase;
  List<CategoryEntity> listOfCategories = [];
  List<ProductEntity> listOfProducts = [];
  Future<void> getCategories() async {
    emit(GetCategoryLoading());
    final result = await _getCategoriesUseCase.call();
    switch (result) {
      case NetworkSuccess<List<CategoryEntity>>():
        listOfCategories = result.data;
        emit(GetCategorySuccess());

      case NetworkError<List<CategoryEntity >>():
        emit(GetCategoryError());
    }
  }

  Future<void> getProducts() async {
    emit(GetProductLoading());
    final result = await _getProductUseCase.call();
    switch (result) {
      case NetworkSuccess<List<ProductEntity>>():
        listOfProducts = result.data;
        emit(GetProductSuccess());
      case NetworkError<List<ProductEntity>>():
        emit(GetProductError());
    }
  }
}
