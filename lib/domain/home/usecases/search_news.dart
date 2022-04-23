import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/usecases/usecase.dart';

import '../../../data/home/datasources/news_datasource.dart';
import '../entities/news.dart';

class SearchNewsParam {
  final String search;

  const SearchNewsParam(this.search);
}

class SearchNews extends UseCase<News, SearchNewsParam> {
  final NewsDataSource newsDataSource;

  const SearchNews(this.newsDataSource);

  @override
  Future<Either<Failure, News>> call(SearchNewsParam params) async {
    var result = await newsDataSource.searchHeadlines(params.search);

    return result;
  }
}
