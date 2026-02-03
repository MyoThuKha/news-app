import 'package:flutter_test/flutter_test.dart';
import 'mock_dio_client.dart';

void main() {
  group('MockDioClient Tests', () {
    late MockDioClient mockDioClient;

    setUp(() {
      mockDioClient = MockDioClient();
    });

    test('should return response.json data on GET request', () async {
      // Act
      final response = await mockDioClient.get('/test-path');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data!['status'], 'ok');
      expect(response.data!['totalResults'], 2);
      expect(response.data!['articles'].length, 2);
    });

    test('should return response.json data on POST request', () async {
      // Act
      final response = await mockDioClient.post(
        '/test-path',
        data: {'key': 'value'},
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data!['status'], 'ok');
      expect(response.data!['totalResults'], 2);
    });

    test('should return response.json data on PUT request', () async {
      // Act
      final response = await mockDioClient.put(
        '/test-path',
        data: {'key': 'value'},
      );

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data!['status'], 'ok');
    });

    test('should return response.json data on DELETE request', () async {
      // Act
      final response = await mockDioClient.delete('/test-path');

      // Assert
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data!['status'], 'ok');
    });
  });
}
