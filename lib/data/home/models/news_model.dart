import '../../../domain/home/entities/news.dart';
import 'article_model.dart';

class NewsModel extends News {
  @override
  // ignore: overridden_fields
  final List<ArticleModel>? articles;

  const NewsModel({String? status, int? totalResults, this.articles})
      : super(status: status, totalResults: totalResults, articles: articles);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel>? articles;

    if (json['articles'] != null) {
      articles = <ArticleModel>[];
      json['articles'].forEach((v) {
        articles!.add(ArticleModel.fromJson(v));
      });
    }

    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
