part of 'saved_news_bloc.dart';

@freezed
class SavedNewsEvent with _$SavedNewsEvent {
  const factory SavedNewsEvent.started() = _Started;
  const factory SavedNewsEvent.savesLoaded() = _SavesLoaded;
}