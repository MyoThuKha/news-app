import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class GetFeaturedNewsUseCase implements StreamUseCase<NewsEntity, NoParams> {
  GetFeaturedNewsUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Stream<NewsEntity> call(NoParams params) {
    return _repository.getFeaturedNews();
  }
}
