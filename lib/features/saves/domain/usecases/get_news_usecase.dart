import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class GetNewsUseCase implements StreamUseCase<List<NewsEntity>, NoParams> {
  GetNewsUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Stream<List<NewsEntity>> call(NoParams params) {
    return _repository.getNews();
  }
}
