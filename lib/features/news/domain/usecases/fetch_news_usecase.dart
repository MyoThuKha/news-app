import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class FetchNewsUseCase implements UseCase<PaginatedNewsEntity, FetchNewsParams> {
  FetchNewsUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Future<PaginatedNewsEntity> call(FetchNewsParams params) {
    return _repository.fetchNews(params.page, pageSize: params.pageSize);
  }
}
