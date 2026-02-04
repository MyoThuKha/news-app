import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/features/news/domain/entities/entities.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsData});

  final NewsEntity newsData;

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
            tag: newsData.urlToImage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: .circular(15),
                color: context.colorScheme.secondaryContainer,
              ),
              clipBehavior: .hardEdge,
              child: CachedNetworkImage(
                imageUrl: newsData.urlToImage,
                width: 120,
                height: .infinity,
                fit: .cover,
                errorWidget: (context, _, _) => Icon(
                  Icons.error,
                  color: context.colorScheme.onSecondaryContainer,
                ),
              ),
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
                    newsData.title,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),

                  Text(
                    newsData.description,
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
