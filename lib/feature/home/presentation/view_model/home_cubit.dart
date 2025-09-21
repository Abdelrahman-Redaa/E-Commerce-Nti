import 'package:bloc/bloc.dart';
import 'package:e_commercenti/core/network/network.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commercenti/feature/home/data/repo/repository/home_repository_contract.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());

  final HomeRepositoryContract _repository;
  List<CategoryResponseDto> listOfCategories = [];
  List<ProductResponseDto> listOfProducts = [];
  Future<void> getCategories() async {
    emit(GetCategoryLoading());
    final result = await _repository.getCategories();
    switch (result) {
      case NetworkSuccess<List<CategoryResponseDto>>():
        listOfCategories = result.data;
        emit(GetCategorySuccess());

      case NetworkError<List<CategoryResponseDto>>():
        emit(GetCategoryError());
    }
  }

  Future<void> getProducts() async {
    emit(GetProductLoading());
    final result = await _repository.getProducts();
    switch (result) {
      case NetworkSuccess<List<ProductResponseDto>>():
        listOfProducts = result.data;
        emit(GetProductSuccess());
      case NetworkError<List<ProductResponseDto>>():
        emit(GetProductError());
    }
  }
}
