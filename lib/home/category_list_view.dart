import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/stores/questcategory_store.dart';
import 'package:provider/provider.dart';

class QuestCategoryListView extends StatelessWidget {

  QuestCategoryListView() : super();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final categories =
            Provider.of<QuestCategoryStore>(context).allCategories;

        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            return ListTile(
              title: Observer(
                builder: (context) => Text(category.description),
              )
            );
          }
        );
      },
    );
  }
}