import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/data/models/source/source_model.dart';
import 'package:news/features/news/domain/entities/entities.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsModel with _$NewsModel {
  @JsonSerializable(explicitToJson: true)
  const factory NewsModel({
    required SourceModel? source,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, Object?> json) =>
      _$NewsModelFromJson(json);
}

extension NewsModelExtension on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      source: source != null
          ? SourceEntity(id: source!.id ?? '', name: source!.name ?? '')
          : const .empty(),
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt != null ? DateTime.tryParse(publishedAt!) : null,
      content: content ?? '',
    );
  }
}

extension SourceModelExtension on SourceModel {
  SourceEntity toEntity() {
    return SourceEntity(id: id ?? '', name: name ?? '');
  }
}
