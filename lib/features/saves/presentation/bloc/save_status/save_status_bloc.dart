import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/news/news_entity.dart';
import 'package:news/features/saves/domain/usecases/usecases.dart';

part 'save_status_event.dart';
part 'save_status_state.dart';
part 'save_status_bloc.freezed.dart';

class SaveStatusBloc extends Bloc<SavedStatusEvent, SavedStatusState> {
  SaveStatusBloc({
    required GetSaveStatusUseCase getStatusUseCase,
    required SaveNewsUseCase savesUseCase,
    required DeleteNewsUseCase deleteUseCase,
  }) : _getSavedStatusUseCase = getStatusUseCase,
       _saveNewsUseCase = savesUseCase,
       _deleteNewsUseCase = deleteUseCase,
       super(_Initial()) {
    on<_SaveStatusLoaded>(_onSaveStatusLoaded);
    on<_SaveAdded>(_onSaveAdded);
    on<_SaveRemoved>(_onSaveRemoved);
  }

  late final GetSaveStatusUseCase _getSavedStatusUseCase;
  late final SaveNewsUseCase _saveNewsUseCase;
  late final DeleteNewsUseCase _deleteNewsUseCase;

  FutureOr<void> _onSaveStatusLoaded(
    _SaveStatusLoaded event,
    Emitter<SavedStatusState> emit,
  ) async {
    final result = await _getSavedStatusUseCase.call(
      GetSaveStatusParams(url: event.url),
    );
    print(result);
    emit(.success(isSaved: result != null));
  }

  FutureOr<void> _onSaveAdded(
    _SaveAdded event,
    Emitter<SavedStatusState> emit,
  ) {
    _saveNewsUseCase.call(SaveNewsParams(news: event.news));
    emit(.updated(isSaved: true));
  }

  FutureOr<void> _onSaveRemoved(
    _SaveRemoved event,
    Emitter<SavedStatusState> emit,
  ) {
    _deleteNewsUseCase.call(DeleteNewsParams(news: event.news));
    emit(.updated(isSaved: false));
  }
}
