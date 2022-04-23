import 'package:get_it/get_it.dart';
import 'package:news_app/domain/home/usecases/get_top_news.dart';
import 'package:news_app/domain/home/usecases/search_news.dart';
import 'package:news_app/presentation/home/blocs/home_bloc.dart';
import 'data/home/datasources/news_datasource.dart';

GetIt magic = GetIt.instance;

void initializeInjector() {
  var newsApiDataSource = NewsDataSource.named(NewsDataSourceEnum.newsapi);

  magic.registerSingleton<NewsDataSource>(newsApiDataSource);

  /// Usecases
  magic.registerSingleton<GetTopNews>(GetTopNews(magic()));
  magic.registerSingleton<SearchNews>(SearchNews(magic()));

  /// Blocs
  magic.registerSingleton<HomeBloc>(HomeBloc(
    getTopNews: magic(),
    searchNews: magic(),
  ));
}
