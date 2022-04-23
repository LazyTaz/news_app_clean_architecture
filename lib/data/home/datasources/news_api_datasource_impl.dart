import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/failure.dart';
import '../../../core/interceptors/dio_error_interceptor.dart';
import '../../../core/interceptors/dio_request_interceptor.dart';
import '../models/news_model.dart';
import 'news_api.dart';
import 'news_datasource.dart';

/// Implementation for https://newsapi.org/
class NewsApiDataSourceImpl implements NewsDataSource {
  /// Dio instance
  /// @RequestInterceptor allows us to inject API key for each request we make
  /// @ErrorInterceptor allows us to transform raw exceptions into managed failures
  final Dio dio = Dio()
    ..interceptors.add(RequestInterceptor())
    ..interceptors.add(ErrorInterceptor());

  late NewsApi _newsApi;

  NewsApiDataSourceImpl() {
    _newsApi = NewsApi(dio);
  }

  @override
  Future<Either<Failure, NewsModel>> getTopHeadlines() async {
    try {
      var result = await _newsApi.getTopHeadlines();

      return right(result);
    } catch (ex) {
      return Left(ex is DioError ? ex.error : const UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, NewsModel>> searchHeadlines(String search) async {
    try {
      var result = await _newsApi.searchHeadlines(search);

      return right(result);
    } catch (ex) {
      return Left(ex is DioError ? ex.error : const UnknownFailure());
    }
  }
}
