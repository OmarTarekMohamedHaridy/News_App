
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/SourcesRespone.dart';
import 'package:news_app/models/news_data.dart';
import '../repo/repo.dart';

import 'states.dart';
class HomeCubit extends Cubit<HomeStates> {
  HomeRepo repo ;
  HomeCubit(this.repo):super(HomeInitState());
  ChangeSource(int value){
    SelectedTab = value ;
    emit(HomeChangeSource());
  }
  static HomeCubit get(context) => BlocProvider.of(context);
  int SelectedTab = 0;
  SourcesResponse? sourcesResponse;
  NewsDataRespone? newsDataResponse;
  Future<void> getSources(String id) async {
    try {
      emit(HomeGetSourcesLoadingState());

      sourcesResponse = await repo.getSources(id);
      emit(HomeGetSourcesSuccessState());

      // Ensure sourceID is not null
      if (sourcesResponse?.sources?.isNotEmpty ?? false) {
        await getNewsData(sourceID: sourcesResponse!.sources![SelectedTab].id);
      } else {
        emit(HomeGetSourcesErrorState()); // Handle empty sources case
      }
    } catch (e) {
      print("Error fetching sources: $e"); // Optional logging
      emit(HomeGetSourcesErrorState());
    }
  }

  Future<void> getNewsData({String? sourceID, String? query, int? pageSize, int? page}) async {
    
    try {
      emit(HomeGetNewsDataLoadingState());
      newsDataResponse = await repo.getNewsData(sourceID: sourceID,query: query,page: page,pageSize: pageSize);
      emit(HomeGetNewsDataSuccessState()); // Emit success for news data
    } catch (e) {
      print("Error fetching news data: $e"); // Optional logging
      emit(HomeGetNewsDataErrorState());
    }
  }
}
