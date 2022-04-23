import 'package:dio/dio.dart';
import 'package:news_app/core/error/failure.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    Failure failure;
    var exception = err.error is Exception ? err.error : Exception(err.error);

    if (err.type == DioErrorType.response) {
      failure = ApiFailure(exception: exception);
    } else {
      failure = NetworkFailure(exception: exception);
    }

    err.error = failure;

    return super.onError(err, handler);
  }
}
