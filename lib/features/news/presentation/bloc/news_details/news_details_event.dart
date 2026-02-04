part of 'news_details_bloc.dart';

@freezed
class NewsDetailsEvent with _$NewsDetailsEvent {
  const factory NewsDetailsEvent.started() = _Started;
  const factory NewsDetailsEvent.detailLoaded({required String url}) =
      _DetailLoaded;
}
