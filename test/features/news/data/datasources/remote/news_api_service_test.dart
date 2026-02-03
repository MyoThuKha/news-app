import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/data/datasources/remote/news_api_service.dart';
import 'package:news/features/news/data/models/models.dart';
import '../../../../../core/network/mock_dio_client.dart';

void main() {
  late NewsApiService newsApiService;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    newsApiService = NewsApiServiceImpl(mockDioClient);
  });

  group('NewsApiService', () {
    test(
      'should return list of NewsModel when fetchNews is successful',
      () async {
        // Act
        final result = await newsApiService.fetchNews();

        // Assert
        expect(result, isA<List<NewsModel>>());
        expect(result.length, equals(2));
        expect(result.first.title, contains('Bitcoin holds below \$80,000'));
        expect(result.last.title, contains('Trump family crypto firm'));
      },
    );
  });
}
