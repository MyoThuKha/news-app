import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/features/news/domain/entities/entities.dart';

class TopNewsWidget extends StatelessWidget {
  const TopNewsWidget({super.key, required this.newsData});

  final NewsEntity newsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
      ),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: newsData.urlToImage,
            width: .infinity,
            height: .infinity,
            fit: .cover,
            errorWidget: (context, url, error) =>
                Icon(Icons.image_rounded, color: context.colorScheme.primary),
            color: Colors.black.withValues(alpha: 0.4),
            colorBlendMode: .darken,
          ),

          Padding(
            padding: const .all(8.0),
            child: Text(
              newsData.title,
              maxLines: 3,
              overflow: .ellipsis,
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                // color: context.colorScheme.onSurface,
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
