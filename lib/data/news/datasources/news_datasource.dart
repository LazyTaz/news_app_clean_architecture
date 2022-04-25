import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/news_model.dart';
import 'news_api_datasource_impl.dart';

/// We only support one API for now
enum NewsDataSourceEnum {
  newsapi,
}

/// Currently supported features
enum NewsDataType {
  topHeadlines,
  searchHeadlines,
}

abstract class NewsDataSource {
  Future<Either<Failure, NewsModel>> getHeadline(NewsDataType type, {Object? arg});

  factory NewsDataSource.named(NewsDataSourceEnum source) {
    switch (source) {
      case NewsDataSourceEnum.newsapi:
        return NewsApiDataSourceImpl();
    }
  }
}
