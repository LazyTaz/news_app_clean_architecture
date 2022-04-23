import 'package:flutter/material.dart';
import 'package:news_app/domain/home/entities/article.dart';

import '../../../constants.dart';

class DetailsPage extends StatelessWidget {
  final Article? article;

  const DetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black, size: 18),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Text(
                  article?.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              _DetailsImage(url: article?.urlToImage ?? notFoundImageUrl),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Text(
                  article?.content ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsImage extends StatelessWidget {
  final String url;

  const _DetailsImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
        width: double.infinity,
        height: 200,
      ),
    );
  }
}
