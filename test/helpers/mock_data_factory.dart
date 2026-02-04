import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/saves/domain/entities/saved_news_entity.dart';

/// Factory for creating mock NewsEntity instances for testing
class MockNewsFactory {
  /// Creates a basic mock news entity
  static NewsEntity createMockNews({
    String? id,
    String? name,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
    DateTime? cachedAt,
    bool? isFeatured,
  }) {
    return NewsEntity(
      source: SourceEntity(
        id: id ?? 'test-source-id',
        name: name ?? 'Test Source',
      ),
      author: author ?? 'Test Author',
      title: title ?? 'Test News Title',
      description:
          description ??
          'This is a test news description for testing purposes. It contains enough text to test various UI scenarios.',
      url: url ?? 'https://example.com/news/1',
      urlToImage: urlToImage ?? 'https://example.com/image.jpg',
      publishedAt:
          publishedAt ?? DateTime.now().subtract(const Duration(hours: 2)),
      content: content ?? 'This is the full content of the test news article.',
      cachedAt: cachedAt ?? DateTime.now(),
      isFeatured: isFeatured ?? false,
    );
  }

  /// Creates a featured news entity (for top news testing)
  static NewsEntity createFeaturedNews({
    String? title,
    String? description,
    String? imageUrl,
  }) {
    return createMockNews(
      title: title ?? 'Featured Breaking News Story',
      description:
          description ??
          'This is a featured news story that should be displayed prominently in the top news section with overlay text.',
      urlToImage: imageUrl ?? 'https://example.com/featured-image.jpg',
      isFeatured: true,
    );
  }

  /// Creates a news entity with long title for testing overflow
  static NewsEntity createNewsWithLongTitle() {
    return createMockNews(
      title:
          'This is an extremely long news title that should definitely overflow and get truncated with ellipsis when displayed in the UI widgets',
    );
  }

  /// Creates a news entity with long description for testing overflow
  static NewsEntity createNewsWithLongDescription() {
    return createMockNews(
      description:
          'This is a very long description that contains multiple sentences and should definitely overflow the allocated space. It is designed to test how the widget handles text overflow and whether it properly truncates the content with ellipsis while maintaining readability and proper layout.',
    );
  }

  /// Creates a news entity with no image for testing error states
  static NewsEntity createNewsWithoutImage() {
    return createMockNews(urlToImage: '');
  }

  /// Creates a news entity with invalid image URL for testing error states
  static NewsEntity createNewsWithInvalidImage() {
    return createMockNews(
      urlToImage: 'https://invalid-url-that-does-not-exist.com/image.jpg',
    );
  }

  /// Creates a list of mock news entities
  static List<NewsEntity> createMockNewsList({int count = 5}) {
    return List.generate(
      count,
      (index) => createMockNews(
        title: 'Test News ${index + 1}',
        description: 'Description for test news item number ${index + 1}',
        url: 'https://example.com/news/${index + 1}',
        urlToImage: 'https://example.com/image${index + 1}.jpg',
        isFeatured: index == 0, // First item is featured
      ),
    );
  }
}

/// Factory for creating mock SavedNewsEntity instances for testing
class MockSavedNewsFactory {
  /// Creates a basic mock saved news entity
  static SavedNewsEntity createMockSavedNews({
    NewsEntity? news,
    DateTime? savedAt,
  }) {
    return SavedNewsEntity(
      news: news ?? MockNewsFactory.createMockNews(),
      savedAt: savedAt ?? DateTime.now().subtract(const Duration(minutes: 30)),
    );
  }

  /// Creates a saved news entity with specific save time
  static SavedNewsEntity createSavedNewsWithTimestamp({
    required DateTime savedAt,
    NewsEntity? news,
  }) {
    return SavedNewsEntity(
      news: news ?? MockNewsFactory.createMockNews(),
      savedAt: savedAt,
    );
  }

  /// Creates a list of mock saved news entities
  static List<SavedNewsEntity> createMockSavedNewsList({int count = 3}) {
    final now = DateTime.now();
    return List.generate(count, (index) {
      final savedTime = now.subtract(Duration(hours: index));
      return createSavedNewsWithTimestamp(
        savedAt: savedTime,
        news: MockNewsFactory.createMockNews(
          title: 'Saved News ${index + 1}',
          description: 'Saved description ${index + 1}',
          url: 'https://example.com/saved/${index + 1}',
        ),
      );
    });
  }
}

/// Constants for test data
class TestData {
  static const String sampleImageUrl = 'https://picsum.photos/400/300';
  static const String invalidImageUrl = 'https://invalid-url.com/image.jpg';
  static const String emptyImageUrl = '';

  static const String longTitle =
      'Breaking News: This is an extremely long headline that extends well beyond the normal display area and should be properly truncated with ellipsis in the user interface';

  static const String shortDescription = 'Short description';

  static const String longDescription =
      'This is a comprehensive news article description that contains multiple sentences and detailed information about the reported event. It includes various aspects of the story and provides context for readers who want to understand the full scope of the situation being reported.';
}
