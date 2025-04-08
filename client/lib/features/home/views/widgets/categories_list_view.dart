import 'package:client/features/home/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16, bottom: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              // context.pushNamed(RoutePaths.category, extra: category);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      category.image,
                      cacheWidth: 50,
                      cacheHeight: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(category.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
