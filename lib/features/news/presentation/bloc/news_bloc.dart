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
  }

  late final FetchNewsUseCase _fetchNewsUseCase;
  late final GetNewsUseCase _getNewsUseCase;

  void _newsLoaded(_NewsLoaded event, Emitter<NewsState> emit) async {
    final stream = _getNewsUseCase.call(NoParams());
    _fetchNewsUseCase.call(NoParams());

    await emit.forEach(
      stream,
      onData: (news) {
        return Success(news: news);
      },
    );
  }

  @override
  void onChange(Change<NewsState> change) {
    print(change.nextState);
    super.onChange(change);
  }
}
