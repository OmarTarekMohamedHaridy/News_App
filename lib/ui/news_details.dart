import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/ui/search_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  static const String routeName = "News";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute
        .of(context)
        ?.settings
        .arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "News App",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: 240,
            ),
            Text(
              article.source?.name ?? "",
              style: const TextStyle(
                  color: Color(0xff79828B),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            Text(article.title ?? ""),
            Text(article.description ?? ""),
            Align(alignment: Alignment.topRight,
              child: Text(
                article.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: 20,),
            Text(article.content ?? ""),
            Spacer(),

            InkWell(
              onTap: () {
                _launchUrl(article.url ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text("View Full Articale ")),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}
