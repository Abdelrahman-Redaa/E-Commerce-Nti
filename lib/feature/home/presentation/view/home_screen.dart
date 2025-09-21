import 'package:e_commercenti/core/common/widget/product_item_widget.dart';
import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/data/model/response/product_response_dto.dart';
import 'package:e_commercenti/feature/home/domain/entities/category_entity.dart';
import 'package:e_commercenti/feature/home/domain/entities/product_entity.dart';
import 'package:e_commercenti/feature/home/presentation/view_model/home_cubit.dart';
import 'package:e_commercenti/feature/home/presentation/widgets/tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: 'Hi !,\n',
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'Let’s start your shopping',
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Categories",
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetCategoryLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: TabContainerWidget(categories: dummyListOfCategories),
                );
              }
              if (state is GetCategorySuccess) {

              }
              return TabContainerWidget(
                categories: context.read<HomeCubit>().listOfCategories,
              );
            },
          ),
          SizedBox(height: 16),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is GetProductLoading) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      childAspectRatio: 163 / 288,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        Skeletonizer(
                          child: ProductItemWidget(
                            product: ProductEntity(
                              images: [imageTest],
                              title: "Dummy Title",
                              price: 123321,
                            ),
                          ),
                        ),
                    itemCount: 4,
                  ),
                );
              }
              if (state is GetProductSuccess) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      childAspectRatio: 163 / 288,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        ProductItemWidget(
                          product: context
                              .read<HomeCubit>()
                              .listOfProducts[index],
                        ),
                    itemCount: context.read<HomeCubit>().listOfProducts.length,
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

var dummyListOfCategories = <CategoryEntity>[
  CategoryEntity(name: "Dummy Name"),
  CategoryEntity(name: "Dummy Name"),
  CategoryEntity(name: "Dummy Name"),
  CategoryEntity(name: "Dummy Name"),
];
