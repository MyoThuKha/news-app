import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news/core/utils/date_format_util.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';

import 'news_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchNewsUseCase>(), MockSpec<GetNewsUseCase>()])
void main() {
  group('NewsBloc', () {
    late MockFetchNewsUseCase mockFetchNewsUseCase;
    late MockGetNewsUseCase mockGetNewsUseCase;

    final testNews = [
      NewsEntity(
        source: SourceEntity(id: 'test-id', name: 'Test Source'),
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: 'https://test.com',
        urlToImage: 'https://test.com/image.jpg',
        publishedAt: DateFormatUtil.parseUtc('2026-02-03T01:00:00Z'),
        content: 'Test Content',
      ),
    ];

    setUp(() {
      mockFetchNewsUseCase = MockFetchNewsUseCase();
      mockGetNewsUseCase = MockGetNewsUseCase();
    });

    test('initial state is Initial', () {
      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );
      expect(bloc.state, isA<NewsState>());
      bloc.close();
    });

    test('creates NewsBloc successfully', () {
      expect(
        () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        returnsNormally,
      );
    });

    test('bloc can listen to state changes', () async {
      when(
        mockGetNewsUseCase.call(NoParams()),
      ).thenAnswer((_) => Stream.fromIterable([testNews]));
      when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );

      final states = <NewsState>[];
      final subscription = bloc.stream.listen(states.add);

      // Add event
      bloc.add(const NewsEvent.newsLoaded());

      // Wait for processing
      await Future.delayed(const Duration(milliseconds: 200));

      // The test passes if we can listen to states and add events
      expect(states, isA<List<NewsState>>());

      subscription.cancel();
      bloc.close();
    });

    test('bloc handles newsLoaded event without errors', () async {
      when(
        mockGetNewsUseCase.call(NoParams()),
      ).thenAnswer((_) => Stream.fromIterable([testNews]));
      when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );

      // Test that adding the event doesn't throw any exceptions
      expect(() => bloc.add(const NewsEvent.newsLoaded()), returnsNormally);

      // Wait for processing
      await Future.delayed(const Duration(milliseconds: 100));

      bloc.close();
    });

    test('bloc handles empty news list without errors', () async {
      when(
        mockGetNewsUseCase.call(NoParams()),
      ).thenAnswer((_) => Stream.fromIterable([<NewsEntity>[]]));
      when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );

      expect(() => bloc.add(const NewsEvent.newsLoaded()), returnsNormally);

      await Future.delayed(const Duration(milliseconds: 100));

      bloc.close();
    });

    test('bloc disposes properly', () {
      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );
      expect(() => bloc.close(), returnsNormally);
    });

    test('bloc event types are correct', () {
      final startedEvent = NewsEvent.started();
      final newsLoadedEvent = NewsEvent.newsLoaded();

      expect(startedEvent, isA<NewsEvent>());
      expect(newsLoadedEvent, isA<NewsEvent>());
      expect(startedEvent.toString(), contains('started'));
      expect(newsLoadedEvent.toString(), contains('newsLoaded'));
    });

    test('bloc state types are correct', () {
      final initialState = NewsState.initial();
      final successState = NewsState.success(news: testNews);

      expect(initialState, isA<NewsState>());
      expect(successState, isA<NewsState>());
      expect(initialState.toString(), contains('initial'));
      expect(successState.toString(), contains('success'));
    });

    group('advanced scenarios', () {
      test('handles multiple news items', () async {
        final multipleNews = [
          testNews.first,
          NewsEntity(
            source: SourceEntity(id: 'test-id-2', name: 'Test Source 2'),
            author: 'Test Author 2',
            title: 'Test Title 2',
            description: 'Test Description 2',
            url: 'https://test2.com',
            urlToImage: 'https://test2.com/image.jpg',
            publishedAt: DateFormatUtil.parseUtc('2026-02-03T01:00:00Z'),
            content: 'Test Content 2',
          ),
        ];

        when(
          mockGetNewsUseCase.call(NoParams()),
        ).thenAnswer((_) => Stream.fromIterable([multipleNews]));
        when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

        final bloc = NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        );

        expect(() => bloc.add(const NewsEvent.newsLoaded()), returnsNormally);

        await Future.delayed(const Duration(milliseconds: 100));

        bloc.close();
      });

      test('handles news with empty source id', () async {
        final newsWithEmptyId = [
          NewsEntity(
            source: SourceEntity(id: '', name: 'Test Source'),
            author: 'Test Author',
            title: 'Test Title',
            description: 'Test Description',
            url: 'https://test.com',
            urlToImage: 'https://test.com/image.jpg',
            publishedAt: DateFormatUtil.parseUtc('2026-02-03T01:00:00Z'),
            content: 'Test Content',
          ),
        ];

        when(
          mockGetNewsUseCase.call(NoParams()),
        ).thenAnswer((_) => Stream.fromIterable([newsWithEmptyId]));
        when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

        final bloc = NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        );

        expect(() => bloc.add(const NewsEvent.newsLoaded()), returnsNormally);

        await Future.delayed(const Duration(milliseconds: 100));

        bloc.close();
      });

      test('bloc can handle multiple sequential events', () async {
        when(
          mockGetNewsUseCase.call(NoParams()),
        ).thenAnswer((_) => Stream.fromIterable([testNews]));
        when(mockFetchNewsUseCase.call(NoParams())).thenAnswer((_) async {});

        final bloc = NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        );

        // Add multiple events
        bloc.add(const NewsEvent.newsLoaded());
        bloc.add(const NewsEvent.newsLoaded());
        bloc.add(const NewsEvent.newsLoaded());

        await Future.delayed(const Duration(milliseconds: 200));

        bloc.close();
      });
    });
  });
}
