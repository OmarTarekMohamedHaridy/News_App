import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home.dart';
import 'package:news_app/ui/search_tab.dart';
import '../models/category_model.dart';
import '../repo/repo.dart';
import 'drawer_widget.dart';


class SettingsScreen extends StatefulWidget {
   const SettingsScreen({super.key});

static const String routeName = "Settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  HomeRepo repo = HomeRepoImpl();
  final List<String> items = [
"English", "Arabic"
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/pattern.png"))),
      child: Scaffold(
          drawer:DrawerWidget(OnClick: onDrawerClick),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading:   IconButton(onPressed: (){Navigator.pushNamed(context, HomeScreen.routeName);}, icon: Icon(Icons.arrow_back)),
      actions: [
      IconButton(onPressed: (){showSearch(context: context, delegate: SearchTab(repo));}, icon: Icon(Icons.search))
      ],
      backgroundColor: Colors.redAccent,
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
        body: Padding(
          padding: const EdgeInsets.only(top: 52.0,left: 5,right: 5),
          child: Container(
            height: 80,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(

                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 60,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                ),
              ),
            ),
          ),
        ),
    )

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
      setState(() {

      });
    }
    else if(id == DrawerWidget.Settings_Id){
      Navigator.pushNamed(context, SettingsScreen.routeName);
    }
    setState(() {

    });
  }
}
