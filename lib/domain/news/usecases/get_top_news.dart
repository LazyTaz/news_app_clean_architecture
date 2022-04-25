import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../repository/news_repository.dart';

import '../entities/news.dart';

class GetTopNews extends UseCase<News, NoParams> {
  final NewsRepository newsRepository;

  const GetTopNews(this.newsRepository);

  @override
  Future<Either<Failure, News>> call(NoParams params) async {
    var result = await newsRepository.getTopHeadlines();

    return result;
  }
}
