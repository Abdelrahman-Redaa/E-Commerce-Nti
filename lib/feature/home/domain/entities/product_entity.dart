import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';

class ProductEntity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  CategoryEntity category;
  List<String> images;

  ProductEntity({
    this.id=0,
    this.title='',
    this.slug='',
    this.price=120,
    this.description='',
    this.category=const CategoryEntity(),
    this.images=const [],
  });


}
