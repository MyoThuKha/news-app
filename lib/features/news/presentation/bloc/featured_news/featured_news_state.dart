part of 'featured_news_bloc.dart';

@freezed
class FeaturedNewsState with _$FeaturedNewsState {
  const factory FeaturedNewsState.initial() = _Initial;
  const factory FeaturedNewsState.loading() = _Loading;
  const factory FeaturedNewsState.empty() = _Empty;

  const factory FeaturedNewsState.success({
    required NewsEntity news,
    @Default(false) bool isCached,
  }) = _Success;
}
