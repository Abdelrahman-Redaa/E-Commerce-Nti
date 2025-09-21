import 'dart:developer';

import 'package:e_commercenti/feature/home/data/model/response/category_response_dto.dart';
import 'package:e_commercenti/feature/home/presentation/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({
    super.key,
    required this.categories,
  });
  final List<CategoryResponseDto > categories;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            onTap: (int index) {
              log('Selected tab: ${widget.categories[index].id}');
            },
            tabs: widget.categories
                .map(
                  (source) =>  TabItemWidget(
                    category: source,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
