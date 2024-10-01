import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/news_ui.dart';
import 'package:news_app/ui/search_tab.dart';
import 'package:news_app/ui/settings_screen.dart';
import '../repo/repo.dart';
import 'categories_tab.dart';
import 'drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeRepo repo = HomeRepoImpl();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/pattern.png"))),
      child: (Scaffold(
        drawer:DrawerWidget(OnClick: onDrawerClick),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){showSearch(context: context, delegate: SearchTab(repo));}, icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "NewsNest",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        body:  categoryModel == null? CategoriesTab(onClicked: onCategorySelected,):NewsUi(id: categoryModel!.id,),
      )),
    );
  }

CategoryModel? categoryModel ;

  onCategorySelected(cat){
categoryModel=cat ;
setState(() {

});
  }

  onDrawerClick(id){
    if(id== DrawerWidget.Category_Id){
      categoryModel=null;
      Navigator.pop(context);
    }
    else if(id == DrawerWidget.Settings_Id){
Navigator.pushNamed(context, SettingsScreen.routeName);
    }
  setState(() {

  });
  }
  }

