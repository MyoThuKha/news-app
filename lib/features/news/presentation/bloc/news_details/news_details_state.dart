part of 'news_details_bloc.dart';

@freezed
class NewsDetailsState with _$NewsDetailsState {
  const factory NewsDetailsState.initial() = _Initial;
  const factory NewsDetailsState.loading() = _Loading;
  const factory NewsDetailsState.success({
    required NewsEntity news,
  }) = _Success;
}
