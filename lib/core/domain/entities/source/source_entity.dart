import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_entity.freezed.dart';

@freezed
abstract class SourceEntity with _$SourceEntity {
  const factory SourceEntity({required String id, required String name}) =
      _SourceEntity;

  const factory SourceEntity.empty({
    @Default('') String id,
    @Default('') String name,
  }) = _Empty;
}
