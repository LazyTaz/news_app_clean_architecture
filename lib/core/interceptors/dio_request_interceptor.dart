import 'package:dio/dio.dart';

import '../../constants.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'Authorization': newsAPIapiKey});

    super.onRequest(options, handler);
  }
}
