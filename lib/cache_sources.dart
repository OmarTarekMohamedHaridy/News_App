import 'dart:async';

import 'package:hive/hive.dart';
import 'package:news_app/models/SourcesRespone.dart';
import 'package:news_app/models/news_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CacheSources {
  static Future<void> saveSources(SourcesResponse response) async {
    final directory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'SourcesList',
      {'sources'},
      path: directory.path,
    );

    final sourcesBox = await collection.openBox<Map>('sources');
    await sourcesBox.put("sources", response.toJson());
    print("saved sources data");
  }


  static Future<SourcesResponse> getSources() async {
    final directory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'SourcesList',
      {'sources'},
      path: directory.path,
    );
    var sourcesBox = await collection.openBox<Map>('sources');
var response = await sourcesBox.get('sources') ;
print("get sources Data $response");
    return SourcesResponse.fromJson(response!);
  }
}
