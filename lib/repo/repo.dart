
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../cache_sources.dart';
import '../models/SourcesRespone.dart';
import '../models/news_data.dart';
import '../utils/constants.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String id);
  Future<NewsDataRespone> getNewsData({String? sourceID, String? query, int? pageSize, int? page});
}

class HomeRepoImpl extends HomeRepo {
  @override
  Future<NewsDataRespone> getNewsData({String? sourceID, String? query, int? pageSize, int? page}) async {
    Uri url = Uri.https(
      Constants.baseURL,
      "/v2/everything",
      {
        "sources": sourceID,
        "q": query,
        "pageSize": pageSize.toString(),
        "page": page.toString()
      },
    );
    http.Response response = await http.get(url, headers: {
      "x-api-key": Constants.apiKey,
    });
    var json = jsonDecode(response.body);

    return NewsDataRespone.fromJson(json);
  }

  @override
  Future<SourcesResponse> getSources(String id) async{
    try {
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
        "apiKey": Constants.apiKey,
        "category": id,
      });
      http.Response response = await http.get(url);

      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      await CacheSources.saveSources(sourcesResponse);
      return sourcesResponse;
    } catch (e) {
      print("Error $e");
      rethrow;
    }
  }
}

