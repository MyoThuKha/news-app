part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.success({
    required List<NewsEntity> news,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isCached
  }) = _Success;
  const factory NewsState.error({required String message}) = _Error;
}
