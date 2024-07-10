import 'package:dio/dio.dart';
import 'package:newsapp2/models/news_model.dart';

class ApiServes
{
  final Dio dio;

  ApiServes({required this.dio});

 Future<List<NewsModel>>  getnews({required String url})
  async {
    Response response=await dio.get(url);
    Map<String,dynamic>datamap=response.data;
    List<dynamic> Artical =datamap['articles'];
    List<NewsModel>ArtList=[];
    for(var art in Artical)
      {
        ArtList.add(NewsModel.fromJson(art));
      }
    return ArtList;
  }

}