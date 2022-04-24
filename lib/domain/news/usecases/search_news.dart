import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/domain/news/repository/news_repository.dart';

import '../entities/news.dart';

class SearchNewsParam {
  final String search;

  const SearchNewsParam(this.search);
}

class SearchNews extends UseCase<News, SearchNewsParam> {
  final NewsRepository newsRepository;

  const SearchNews(this.newsRepository);

  @override
  Future<Either<Failure, News>> call(SearchNewsParam params) async {
    var result = await newsRepository.searchHeadlines(params.search);

    return result;
  }
}
