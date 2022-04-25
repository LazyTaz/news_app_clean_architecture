import 'package:get_it/get_it.dart';
import 'domain/news/repository/news_repository.dart';
import 'presentation/home/blocs/home_bloc.dart';
import 'data/news/datasources/news_datasource.dart';
import 'domain/news/usecases/get_top_news.dart';
import 'domain/news/usecases/search_news.dart';

GetIt magic = GetIt.instance;

void initializeInjector() {
  /// if you want to chose one API over another, it's here.
  var newsApiDataSource = NewsDataSource.named(NewsDataSourceEnum.newsapi);
  magic.registerSingleton<NewsDataSource>(newsApiDataSource);
  magic.registerSingleton(NewsRepository(newsDataSource: magic()));

  /// Usecases
  magic.registerSingleton<GetTopNews>(GetTopNews(magic()));
  magic.registerSingleton<SearchNews>(SearchNews(magic()));

  /// Blocs
  magic.registerSingleton<HomeBloc>(HomeBloc(
    getTopNews: magic(),
    searchNews: magic(),
  ));
}
