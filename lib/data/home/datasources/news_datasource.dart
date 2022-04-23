import 'package:dartz/dartz.dart';
import 'package:news_app/data/home/datasources/news_api_datasource_impl.dart';

import '../../../../core/error/failure.dart';
import '../models/news_model.dart';

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
