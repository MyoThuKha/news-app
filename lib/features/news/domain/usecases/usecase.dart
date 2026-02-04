abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

class NoParams {
  const NoParams();
}

class FetchNewsParams {
  const FetchNewsParams({required this.page, this.pageSize = 20});
  final int page;
  final int pageSize;
}

class FetchNewsDetailParams {
  const FetchNewsDetailParams({required this.url});

  final String url;
}
