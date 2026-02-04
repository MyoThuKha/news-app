import 'package:news/core/domain/entities/news/news_entity.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

class NoParams {
  const NoParams();
}

class SaveNewsParams {
  const SaveNewsParams({required this.news});
  final NewsEntity news;
}
class DeleteNewsParams {
  const DeleteNewsParams({required this.news});
  final NewsEntity news;
}
class GetSaveStatusParams {
  const GetSaveStatusParams({required this.url});
  final String url;
}

