import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/features/news/domain/entities/entities.dart';

class TopNewsWidget extends StatelessWidget {
  const TopNewsWidget({super.key, required this.newsData});

  final NewsEntity newsData;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: newsData.urlToImage,
      width: 120,
      height: .infinity,
      fit: .cover,
      placeholder: (context, url) {
        return ClipRRect(
          borderRadius: .circular(15),
          child: ColoredBox(color: context.colorScheme.secondaryContainer),
        );
      },
    );
  }
}
