import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';

class GetNewsDetailUseCase
    implements StreamUseCase<NewsEntity, FetchNewsDetailParams> {
  GetNewsDetailUseCase(this._repository);

  final NewsRepository _repository;

  @override
  Stream<NewsEntity> call(FetchNewsDetailParams params) {
    return _repository.getNewsDetail(params.url);
  }
}
