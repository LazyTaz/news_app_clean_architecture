import 'package:equatable/equatable.dart';

import 'article.dart';

class News extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const News({required this.status, required this.totalResults, required this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}
