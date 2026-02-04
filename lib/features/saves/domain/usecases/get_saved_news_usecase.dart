import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';
import 'package:news/features/saves/domain/usecases/usecase.dart';

class GetSavedNewsUseCase implements StreamUseCase<List<SavedNewsEntity>, NoParams> {
  GetSavedNewsUseCase(this._repository);

  final SavedNewsRepository _repository;

  @override
  Stream<List<SavedNewsEntity>> call(NoParams params) {
    return _repository.watchSavedNews();
  }
}
