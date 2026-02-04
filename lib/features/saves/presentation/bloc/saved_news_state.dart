part of 'saved_news_bloc.dart';

@freezed
class SavedNewsState with _$SavedNewsState {
  const factory SavedNewsState.initial() = _Initial;
  const factory SavedNewsState.loading() = _Loading;
  const factory SavedNewsState.error(String message) = _Error;
  const factory SavedNewsState.success({required List<SavedNewsEntity> news}) =
      _Success;

  const factory SavedNewsState.updated({required bool isSaved}) = _Updated;
}
