import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class FetchNewsUseCase implements UseCase<void, NoParams> {
  FetchNewsUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Future<void> call(NoParams params) {
    return _repository.fetchNews();
  }
}
