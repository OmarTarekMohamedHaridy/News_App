import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryModel, required this.isOdd});
  CategoryModel categoryModel;
  bool isOdd;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
             bottomLeft: !isOdd? Radius.circular(25): Radius.zero ,

              bottomRight:isOdd? Radius.circular(25): Radius.zero ,)),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(
            categoryModel.name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
