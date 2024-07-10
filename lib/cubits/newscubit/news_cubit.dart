
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/cubits/newscubit/news_state.dart';
import 'package:newsapp2/models/sevices.dart';

import '../../models/news_model.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitalStates());
  static NewsCubit get(context)=>BlocProvider.of(context);



  List<NewsModel>artListtop = [];
  List<NewsModel>artListall = [];
  List<NewsModel>artListbus = [];
  List<NewsModel>artListsports = [];
  List<NewsModel>artListscinces = [];

 gettoplinesnews()  {
   if(artListtop.isEmpty) {
     emit(NewsLoadingDataStates());
     try {
       ApiServes(dio: Dio())
           .getnews(
           url: 'https://newsapi.org/v2/top-headlines?country=us&apiKey=d9b26400797f4a56be2cbe5547d6ff12')
           .then((val) {
         artListtop = val;
         emit(NewsSuccssDataStates());
       });
     }
     catch (e) {
       print(e.toString());
       emit(NewsFailurDataStates());
     }
   }
  }

  getallnews()  {
   if(artListall.isEmpty) {
     emit(NewsLoadingDataStates());
     try {
       ApiServes(dio: Dio())
           .getnews(
           url: 'https://newsapi.org/v2/everything?q=all&apiKey=d9b26400797f4a56be2cbe5547d6ff12')
           .then((val) {
         artListall = val;
         emit(NewsSuccssDataStates());
       });
     }
     catch (e) {
       print(e.toString());
       emit(NewsFailurDataStates());
     }
   }
  }


  getbusnews()  {
   if(artListbus.isEmpty) {
     emit(NewsLoadingDataStates());
     try {
       ApiServes(dio: Dio())
           .getnews(
           url: 'https://newsapi.org/v2/top-headlines?category=business&country=us&apiKey=d9b26400797f4a56be2cbe5547d6ff12')
           .then((val) {
         artListbus = val;
         emit(NewsSuccssDataStates());
       });
     }
     catch (e) {
       print(e.toString());
       emit(NewsFailurDataStates());
     }
   }
  }



  getsportsnews()  {
   if(artListsports.isEmpty) {
     emit(NewsLoadingDataStates());
     try {
       ApiServes(dio: Dio())
           .getnews(
           url: 'https://newsapi.org/v2/top-headlines?category=sports&country=us&apiKey=d9b26400797f4a56be2cbe5547d6ff12')
           .then((val) {
         artListsports = val;
         emit(NewsSuccssDataStates());
       });
     }
     catch (e) {
       print(e.toString());
       emit(NewsFailurDataStates());
     }
   }
  }


  getsciencesnews()  {
   if(artListscinces.isEmpty) {
     emit(NewsLoadingDataStates());
     try {
       ApiServes(dio: Dio())
           .getnews(
           url: 'https://newsapi.org/v2/top-headlines?category=science&country=us&apiKey=d9b26400797f4a56be2cbe5547d6ff12')
           .then((val) {
         artListscinces = val;
         emit(NewsSuccssDataStates());
       });
     }
     catch (e) {
       print(e.toString());
       emit(NewsFailurDataStates());
     }
   }
  }




}