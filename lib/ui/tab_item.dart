import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesRespone.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, super.key, required this.source});
  Sources source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.green),
            color: isSelected ? Colors.green : Colors.transparent),
        child: Text(source.name ?? "",style: TextStyle(fontSize: 18,color: isSelected ? Colors.white : Colors.green),));
  }
}
