import 'package:flutter/material.dart';
import 'package:news_app/ui/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesTab extends StatelessWidget {
   CategoriesTab({super.key,required this.onClicked});
  var categories = CategoryModel.getCategories();
 Function onClicked ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("Pick your category of interest",style: TextStyle(fontSize: 35),),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12,crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {

                      onClicked(categories[index]);
                    },
                    child: CategoryItem(categoryModel: categories[index],isOdd: index.isOdd,));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
