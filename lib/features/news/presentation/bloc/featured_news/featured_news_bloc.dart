import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/news/news_entity.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';

part 'featured_news_event.dart';
part 'featured_news_state.dart';
part 'featured_news_bloc.freezed.dart';

class FeaturedNewsBloc extends Bloc<FeaturedNewsEvent, FeaturedNewsState> {
  FeaturedNewsBloc({
    required GetFeaturedNewsUseCase getFeaturedNewsUseCase,
    required FetchFeaturedNewsUseCase fetchFeaturedNewsUseCase,
  }) : _getFeaturedNewsUseCase = getFeaturedNewsUseCase,
       _fetchFeaturedNewsUseCase = fetchFeaturedNewsUseCase,
       super(_Initial()) {
    on<_FeaturedNewsLoaded>(_onNewsLoaded);
    on<_FeaturedNewsRefreshed>(_onRefreshed);
  }

  late final GetFeaturedNewsUseCase _getFeaturedNewsUseCase;
  late final FetchFeaturedNewsUseCase _fetchFeaturedNewsUseCase;

  void _onRefreshed(
    _FeaturedNewsRefreshed event,
    Emitter<FeaturedNewsState> emit,
  ) async {
    emit(const .loading());
    await _fetchFeaturedNewsUseCase.call(FetchNewsParams(page: 1));
  }

  void _onNewsLoaded(
    _FeaturedNewsLoaded event,
    Emitter<FeaturedNewsState> emit,
  ) async {
    emit(.loading());

    bool isCached = false;

    try {
      await _fetchFeaturedNewsUseCase.call(FetchNewsParams(page: 1));
    } catch (e) {
      isCached = true;
    }

    final stream = _getFeaturedNewsUseCase.call(NoParams());
    await emit.forEach(
      stream,
      onData: (news) {
        if (news == null) return const .empty();
        return .success(news: news, isCached: isCached);
      },
    );
  }

  @override
  void onChange(Change<FeaturedNewsState> change) {
    print(change.nextState);
    super.onChange(change);
  }
}
