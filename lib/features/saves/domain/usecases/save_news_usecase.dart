import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';
import 'package:news/features/saves/domain/usecases/usecase.dart';

class SaveNewsUseCase implements UseCase<void, SaveNewsParams> {
  SaveNewsUseCase(this._repository);

  final SavedNewsRepository _repository;

  @override
  Future<void> call(SaveNewsParams params) async {
    return _repository.saveNews(params.news);
  }
}
