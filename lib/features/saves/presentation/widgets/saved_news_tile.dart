import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/features/saves/domain/entities/entities.dart';

class SavedNewsTile extends StatelessWidget {
  const SavedNewsTile({super.key, required this.newsData});

  final SavedNewsEntity newsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(5),
      height: 150,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: .circular(20),
      ),
      child: Row(
        spacing: 15,
        children: [
          // MARK: Leading image
          Hero(
            tag: newsData.news.urlToImage,
            child: CachedNetworkImage(
              imageUrl: newsData.news.urlToImage,
              width: 120,
              height: .infinity,
              fit: .cover,
              placeholder: (context, url) {
                return ClipRRect(
                  borderRadius: .circular(15),
                  child: ColoredBox(
                    color: context.colorScheme.secondaryContainer,
                  ),
                );
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(15),
                    color: context.colorScheme.secondaryContainer,
                    image: DecorationImage(image: imageProvider, fit: .cover),
                  ),
                );
              },
            ),
          ),

          // MARK: Info section
          Expanded(
            child: Padding(
              padding: const .only(top: 15, bottom: 15, right: 10),
              child: Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    newsData.news.title,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),

                  Text(
                    newsData.news.description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 3,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
