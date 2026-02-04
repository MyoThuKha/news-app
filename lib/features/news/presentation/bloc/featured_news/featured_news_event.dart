part of 'featured_news_bloc.dart';

@freezed
class FeaturedNewsEvent with _$FeaturedNewsEvent {
  const factory FeaturedNewsEvent.started() = _Started;
  const factory FeaturedNewsEvent.featuredNewsLoaded() = _FeaturedNewsLoaded;
  const factory FeaturedNewsEvent.featuredNewsRefreshed() = _FeaturedNewsRefreshed;
}