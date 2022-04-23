import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/data/home/datasources/news_datasource.dart';
import 'package:news_app/domain/home/entities/news.dart';

class GetTopNews extends UseCase<News, NoParams> {
  final NewsDataSource newsDataSource;

  const GetTopNews(this.newsDataSource);

  @override
  Future<Either<Failure, News>> call(NoParams params) async {
    var result = await newsDataSource.getTopHeadlines();

    return result;
  }
}
