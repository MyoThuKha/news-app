import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';
import 'package:news/features/saves/domain/usecases/usecase.dart';

class GetSaveStatusUseCase implements UseCase<SavedNewsEntity?, GetSaveStatusParams> {
  GetSaveStatusUseCase(this._repository);

  final SavedNewsRepository _repository;

  @override
  Future<SavedNewsEntity?> call(GetSaveStatusParams params) {
    return _repository.getSaveNewsByUrl(params.url);
  }
}
