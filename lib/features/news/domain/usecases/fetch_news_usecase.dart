import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class FetchNewsUseCase implements UseCase<PagedArticles, FetchNewsParams> {
  FetchNewsUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Future<PagedArticles> call(FetchNewsParams params) {
    return _repository.fetchNews(params.page, pageSize: params.pageSize);
  }
}
