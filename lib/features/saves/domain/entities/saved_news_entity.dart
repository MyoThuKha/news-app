import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/entities.dart';

part 'saved_news_entity.freezed.dart';

@freezed
abstract class SavedNewsEntity with _$SavedNewsEntity {
  const factory SavedNewsEntity({
    required NewsEntity news,
    required DateTime savedAt,
  }) = _SavedNewsEntity;
}
