import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/ui/news_details.dart';

class NewsItem extends StatelessWidget {
   NewsItem({required this.article,super.key});
Articles article ;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){Navigator.pushNamed(context, NewsDetails.routeName,arguments:article);},
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200
        ,borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        ClipRRect(borderRadius: BorderRadius.circular(18),
            child: Image.network(article.urlToImage?? "",height: 240,)),
          Text(article.source?.name??"",style: const TextStyle(color: Color(0xff79828B),fontWeight:FontWeight.w400,fontSize: 10 ),),
          Text(article.title??""),
          Text(article.description??"",maxLines: 3,),
            Text(article.publishedAt?.substring(0,10)??"",textAlign: TextAlign.end,),
        ],),
      ),
    );
  }
}
