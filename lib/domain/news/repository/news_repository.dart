import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/data/news/datasources/news_datasource.dart';

import '../entities/news.dart';

/// This class cast `NewsDataSource` return value
/// from *model* NewsModel to *entitie* News
/// Which allows us to go from data layer to domain layer safely.
class NewsRepository {
  final NewsDataSource newsDataSource;

  NewsRepository({required this.newsDataSource});

  Future<Either<Failure, News>> getTopHeadlines() async {
    return await newsDataSource.getTopHeadlines();
  }

  Future<Either<Failure, News>> searchHeadlines(String search) async {
    return await newsDataSource.searchHeadlines(search);
  }
}
