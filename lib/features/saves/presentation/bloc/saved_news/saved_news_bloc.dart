import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
       super(_Initial()) {
    on<_SavesLoaded>(_onSavesLoaded);
  }

  late final GetSavedNewsUseCase _getNewsUseCase;

  FutureOr<void> _onSavesLoaded(
    SavedNewsEvent event,
    Emitter<SavedNewsState> emit,
  ) async {
    final stream = _getNewsUseCase.call(const NoParams());
    await emit.forEach(stream, onData: (data) => .success(news: data));
  }
}
