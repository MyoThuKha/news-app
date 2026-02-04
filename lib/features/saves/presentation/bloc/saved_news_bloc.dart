import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/usecases/usecases.dart';

part 'saved_news_event.dart';
part 'saved_news_state.dart';
part 'saved_news_bloc.freezed.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  SavedNewsBloc({
    required GetSavedNewsUseCase getNewsUseCase,
    required SaveNewsUseCase savesUseCase,
    required DeleteNewsUseCase deleteUseCase,
  }) : _getNewsUseCase = getNewsUseCase,
       _saveNewsUseCase = savesUseCase,
       _deleteNewsUseCase = deleteUseCase,
       super(_Initial()) {
    on<_SavesLoaded>(_onSavesLoaded);
    on<_SaveAdded>(_onSaveAdded);
    on<_SaveRemoved>(_onSaveRemoved);
  }

  late final GetSavedNewsUseCase _getNewsUseCase;
  late final SaveNewsUseCase _saveNewsUseCase;
  late final DeleteNewsUseCase _deleteNewsUseCase;

  FutureOr<void> _onSavesLoaded(
    SavedNewsEvent event,
    Emitter<SavedNewsState> emit,
  ) async {
    final stream = _getNewsUseCase.call(const NoParams());
    await emit.forEach(stream, onData: (data) => .success(news: data));
  }

  FutureOr<void> _onSaveAdded(_SaveAdded event, Emitter<SavedNewsState> emit) {
    _saveNewsUseCase.call(SaveNewsParams(news: event.news));
    emit(.updated(isSaved: true));
  }

  FutureOr<void> _onSaveRemoved(
    _SaveRemoved event,
    Emitter<SavedNewsState> emit,
  ) {
    _deleteNewsUseCase.call(DeleteNewsParams(news: event.news));
    emit(.updated(isSaved: false));
  }
}
