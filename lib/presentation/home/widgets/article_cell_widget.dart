import 'package:flutter/material.dart';
import 'package:news_app/domain/home/entities/article.dart';

import '../../../constants.dart';

class ArticleCellWidget extends StatelessWidget {
  final Article article;

  const ArticleCellWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _ArticleCellImage(article.urlToImage ?? notFoundImageUrl),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _ArticleCellInfos(article: article),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleCellImage extends StatelessWidget {
  final String url;

  const _ArticleCellImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Hero(
        tag: url,
        child: Image.network(
          url,
          width: 130,
          height: 170,
          fit: BoxFit.cover,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) return child;

            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ArticleCellInfos extends StatelessWidget {
  final Article article;

  const _ArticleCellInfos({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            article.title ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            article.description ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            article.publishedAt ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
