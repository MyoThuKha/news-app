part of 'save_status_bloc.dart';

@freezed
class SavedStatusState with _$SavedStatusState {
  const factory SavedStatusState.initial() = _Initial;
  const factory SavedStatusState.success({required bool isSaved}) = _Success;
  const factory SavedStatusState.updated({required bool isSaved}) = _Updated;
}
