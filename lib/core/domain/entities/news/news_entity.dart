import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/domain/entities/source/source_entity.dart';

part 'news_entity.freezed.dart';

@freezed
abstract class NewsEntity with _$NewsEntity {
  const factory NewsEntity({
    required SourceEntity source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime? publishedAt,
    required String content,
    required DateTime? cachedAt,
    required bool isFeatured,
  }) = _NewsEntity;
}
