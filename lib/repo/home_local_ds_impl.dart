import 'package:news_app/cache_sources.dart';
import 'package:news_app/models/SourcesRespone.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/repo/repo.dart';

class HomeLocalDsImpl implements HomeRepo {
  @override
  Future<NewsDataRespone> getNewsData({String? sourceID, String? query, int? pageSize, int? page}) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String id) async {
 try{
SourcesResponse response =await CacheSources.getSources();
print("${response}");
   return response;

 }
     catch(e){
   print("Error ${e.toString()}");
   rethrow;
     }
  }

}
