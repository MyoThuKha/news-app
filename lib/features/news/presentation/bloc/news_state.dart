part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.success({required List<NewsEntity> news}) = Success;
}
