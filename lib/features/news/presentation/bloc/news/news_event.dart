part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.started() = _Started;
  const factory NewsEvent.newsLoaded() = _NewsLoaded;
  const factory NewsEvent.newsRefreshed(
   { 
    final Completer<void>? refreshCompleter,
   }
  ) = _NewsRefreshed;
  const factory NewsEvent.loadMore() = _NewsLoadMore;
}
