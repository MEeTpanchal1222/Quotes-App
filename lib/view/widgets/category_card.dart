import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/category_search.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CategoryView(category: category));
      },
      child: Card(
        child: Center(
          child: Text(
            category,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
