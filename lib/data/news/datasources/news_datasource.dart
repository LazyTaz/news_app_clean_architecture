import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/news_model.dart';
import 'news_api_datasource_impl.dart';

/// We only support one API for now
enum NewsDataSourceEnum {
  newsapi,
}

/// We may want to be more generic here
abstract class NewsDataSource {
  Future<Either<Failure, NewsModel>> getTopHeadlines();
  Future<Either<Failure, NewsModel>> searchHeadlines(String search);

  factory NewsDataSource.named(NewsDataSourceEnum source) {
    switch (source) {
      case NewsDataSourceEnum.newsapi:
        return NewsApiDataSourceImpl();
    }
  }
}
