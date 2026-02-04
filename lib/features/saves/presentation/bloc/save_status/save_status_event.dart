part of 'save_status_bloc.dart';

@freezed
class SavedStatusEvent with _$SavedStatusEvent {
  const factory SavedStatusEvent.started() = _Started;

  const factory SavedStatusEvent.saveStatusLoaded({required String url}) =
      _SaveStatusLoaded;
  const factory SavedStatusEvent.saveRemoved(NewsEntity news) = _SaveRemoved;
  const factory SavedStatusEvent.saveAdded(NewsEntity news) = _SaveAdded;

  const factory SavedStatusEvent.saveToggled(NewsEntity news) = _SaveToggled;
}
