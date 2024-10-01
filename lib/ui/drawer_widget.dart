import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function OnClick ;
   DrawerWidget({required this.OnClick,super.key});
static const int Category_Id =1 ;
  static const int Settings_Id =2 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          height: 200,
        color: Colors.green,
        child: Text("NewsNest",style: TextStyle(color: Colors.white,fontSize: 30),),
        alignment: Alignment.center,),
          SizedBox(height: 20,),
        InkWell(
            onTap: () {
              OnClick(Category_Id);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.library_books,color: Colors.black,),
                 SizedBox(width: 20,),
                  Text("Categories",style: TextStyle(color: Colors.black,fontSize: 30),),

                ],
              ),
            )),
        SizedBox(height: 10,),
        InkWell(
            onTap: () {
              OnClick(Settings_Id);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [Icon(Icons.settings,color: Colors.black,),
                  SizedBox(width: 20,),
                  Text("Settings",style: TextStyle(color: Colors.black,fontSize: 30),),
                ],
              ),
            )),
      ],),
    );
  }
}
