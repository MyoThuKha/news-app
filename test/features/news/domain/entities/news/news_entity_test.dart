import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/domain/entities/entities.dart';

void main() {
  group('Testing NewsEntity', () {

    final data = NewsEntity(
      source: SourceEntity(id: '', name: 'Source'),
      author: 'author',
      title: 'title',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      publishedAt: 'publishedAt',
      content: 'content',
    );

    final data2 = NewsEntity(
      source: SourceEntity(id: '', name: 'Source'),
      author: 'author',
      title: 'title',
      description: 'description',
      url: 'url',
      urlToImage: 'urlToImage',
      publishedAt: 'publishedAt',
      content: 'content',
    );

    test('Testing [==]', () {
      expect(data, data2);
    });

    test('Testing [copyWith]', () {
      final updatedEntity = data.copyWith(author: 'John');
      expect(updatedEntity.author, 'John');

      final updatedEntity2 = data2.copyWith(author: 'John');
      expect(updatedEntity, updatedEntity2);
    });

    test('Testing [copyWith] with updated SOURCE', () {
      final updatedEntity = data.copyWith(
        source: SourceEntity(id: 'new-york-times', name: 'New York Times'),
      );
      expect(updatedEntity.source.id, 'new-york-times');
      expect(updatedEntity.source.name, 'New York Times');

      // 
      final updatedEntity2 = data2.copyWith(
        source: SourceEntity(id: 'new-york-times', name: 'New York Times'),
      );
      expect(updatedEntity, updatedEntity2);
    });
  });
}
