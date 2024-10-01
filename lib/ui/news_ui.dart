
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/repo/home_local_ds_impl.dart';
import 'package:news_app/repo/home_remote_ds_impl.dart';
import 'package:news_app/ui/tab_item.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../main.dart';
import 'news_item.dart';

class NewsUi extends StatelessWidget {

  NewsUi({required this.id,super.key});
  String id ;

  @override
  Widget build(BuildContext context) {
return LoaderOverlay(
  child: BlocProvider(create: (context) => HomeCubit(isConnect ?HomeRemoteDsImpl() :HomeLocalDsImpl() )..getSources(id),
  child: BlocConsumer<HomeCubit,HomeStates>(
    listener: (context, state) {
      if(state is HomeChangeSource){HomeCubit.get(context).getNewsData(sourceID:HomeCubit.get(context).sourcesResponse?.sources?[HomeCubit.get(context).SelectedTab].id ?? "");}
      if(state is HomeGetNewsDataLoadingState || state is HomeGetNewsDataLoadingState ){
        context.loaderOverlay.show();
      }
else{context.loaderOverlay.hide();}
if(state is HomeGetNewsDataErrorState){
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text("Error"),
    content: Text("Something went wrong"),
  ),);
}
      if(state is HomeGetSourcesErrorState){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SomeThing went wrong")));
      }
    },
    builder: (context, state) {
  if(state is HomeGetSourcesErrorState){return
  Text("something went wrong");}
      return Padding(
        padding: const EdgeInsets.all(12.0),
      child: Column(
      children: [
      DefaultTabController(
      length:HomeCubit.get(context).sourcesResponse?.sources?.length?? 0 ,
      child: TabBar(
      isScrollable: true,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      onTap: (value) {
HomeCubit.get(context).ChangeSource(value);
      },
      tabs: HomeCubit.get(context)
          .sourcesResponse
          ?.sources
          ?.map((e) => TabItem(
      source: e,
      isSelected: HomeCubit.get(context).sourcesResponse!.sources!.elementAt(HomeCubit.get(context).SelectedTab) == e))
          .toList() ?? [] )),
       Expanded(
      child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10,),


      itemBuilder: (context, index) {
      return  NewsItem(article:HomeCubit.get(context).newsDataResponse!.articles![index]);

      },
      itemCount: HomeCubit.get(context).newsDataResponse?.articles?.length ?? 0,),
      )]));
  },) ,),
);

  }
}
