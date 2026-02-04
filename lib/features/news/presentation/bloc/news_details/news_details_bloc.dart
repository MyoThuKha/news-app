import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/get_news_detail_usecase.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

part 'news_details_event.dart';
part 'news_details_state.dart';
part 'news_details_bloc.freezed.dart';

class NewsDetailsBloc extends Bloc<NewsDetailsEvent, NewsDetailsState> {
  NewsDetailsBloc({required GetNewsDetailUseCase getNewsDetailUseCase})
    : _getNewsDetailUseCase = getNewsDetailUseCase,
      super(_Initial()) {
    on<_DetailLoaded>(_onDetailLoaded);
  }

  late final GetNewsDetailUseCase _getNewsDetailUseCase;

  FutureOr<void> _onDetailLoaded(
    _DetailLoaded event,
    Emitter<NewsDetailsState> emit,
  ) async {
    final stream = _getNewsDetailUseCase.call(
      FetchNewsDetailParams(url: event.url),
    );

    await emit.forEach(stream, onData: (news) => .success(news: news));
  }


  @override
  void onChange(Change<NewsDetailsState> change) {
    print(change.nextState);
    super.onChange(change);
  }
}
