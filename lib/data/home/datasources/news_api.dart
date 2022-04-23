/* 
# dart
pub run build_runner build

# flutter	
flutter pub run build_runner build
*/

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/news_model.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  @GET("/top-headlines?country={country}")
  Future<NewsModel> getTopHeadlines({@Path() String country = 'fr'});

  @GET("/everything?q={search}&language={language}")
  Future<NewsModel> searchHeadlines(@Path() String search, {@Path() String language = 'fr'});
}
