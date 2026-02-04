import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required FetchNewsUseCase fetchNewsUseCase,
    required GetNewsUseCase getNewsUseCase,
  }) : _fetchNewsUseCase = fetchNewsUseCase,
       _getNewsUseCase = getNewsUseCase,
       super(_Initial()) {
    on<_NewsLoaded>(_newsLoaded);
    on<_NewsRefreshed>(_newsRefreshed);
    on<_NewsLoadMore>(_newsLoadMore);
  }

  late final FetchNewsUseCase _fetchNewsUseCase;
  late final GetNewsUseCase _getNewsUseCase;

  int _page = 1;
  bool _hasMore = true;

  void _newsRefreshed(_NewsRefreshed event, Emitter<NewsState> emit) async {
    _page = 1;
    bool isCached = false;
    try {
      await _fetchNewsUseCase.call(FetchNewsParams(page: _page));
    } catch (e) {
      isCached = true;
    }

    state.maybeWhen(
      orElse: () {},
      success: (news, _, _, _) {
        emit(.success(news: news, isCached: isCached));
      },
    );

    event.refreshCompleter?.complete();
  }

  void _newsLoadMore(_NewsLoadMore event, Emitter<NewsState> emit) async {
    if (state is! _Success) return;
    final newsState = state as _Success;

    if (!_hasMore) {
      emit(newsState.copyWith(hasReachedMax: true));
      return;
    }

    emit(newsState.copyWith(isMoreLoading: true));
    _page++;
    final pagedArticles = await _fetchNewsUseCase.call(
      FetchNewsParams(page: _page),
    );
    _hasMore = pagedArticles.hasMore;
    emit(newsState.copyWith(isMoreLoading: false));
  }

  void _newsLoaded(_NewsLoaded event, Emitter<NewsState> emit) async {
    emit(.loading());

    bool isCached = false;

    try {
      final news = await _fetchNewsUseCase.call(FetchNewsParams(page: _page));
      _hasMore = news.hasMore;
    } catch (e) {
      isCached = true;
    }

    final stream = _getNewsUseCase.call(NoParams());
    await emit.forEach(
      stream,
      onData: (news) => .success(news: news, isCached: isCached),
    );
  }

  @override
  void onChange(Change<NewsState> change) {
    print(change.nextState);
    super.onChange(change);
  }
}
