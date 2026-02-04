import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';
import 'package:news/features/saves/domain/usecases/usecase.dart';

class DeleteNewsUseCase implements UseCase<void, DeleteNewsParams> {
  DeleteNewsUseCase(this._repository);

  final SavedNewsRepository _repository;

  @override
  Future<void> call(DeleteNewsParams params) async {
    return _repository.deleteNews(params.news);
  }
}
