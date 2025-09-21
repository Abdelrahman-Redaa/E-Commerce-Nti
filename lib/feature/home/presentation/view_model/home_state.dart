part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class GetCategoryLoading extends HomeState {}

class GetCategorySuccess extends HomeState {}

class GetCategoryError extends HomeState {}

class GetProductLoading extends HomeState {}

class GetProductSuccess extends HomeState {}

class GetProductError extends HomeState {}
