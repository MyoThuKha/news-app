import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/get_news_detail_usecase.dart';
import 'package:news/features/news/domain/usecases/usecase.dart';
import 'package:news/features/news/presentation/bloc/news_details/news_details_bloc.dart';

import 'news_details_bloc_test.mocks.dart';

@GenerateMocks([GetNewsDetailUseCase])
void main() {
  group('NewsDetailsBloc', () {
    late MockGetNewsDetailUseCase mockGetNewsDetailUseCase;
    late NewsEntity testNewsEntity;
    const testUrl = 'https://example.com/news/1';

    setUp(() {
      mockGetNewsDetailUseCase = MockGetNewsDetailUseCase();
      testNewsEntity = NewsEntity(
        source: SourceEntity(id: '1', name: 'Test Source'),
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: testUrl,
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Test Content',
        cachedAt: DateTime.now(),
        isFeatured: false,
      );
    });

    test('initial state is _Initial', () {
      expect(
        NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase).state,
        equals(const NewsDetailsState.initial()),
      );
    });

    blocTest<NewsDetailsBloc, NewsDetailsState>(
      'emits success state when news detail is loaded',
      setUp: () {
        when(
          mockGetNewsDetailUseCase.call(any),
        ).thenAnswer((_) => Stream.value(testNewsEntity));
      },
      build: () =>
          NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase),
      act: (bloc) =>
          bloc.add(const NewsDetailsEvent.detailLoaded(url: testUrl)),
      expect: () => [
        isA<NewsDetailsState>()
            .having(
              (state) =>
                  state.maybeMap(orElse: () => false, success: (_) => true),
              'is success state',
              true,
            )
            .having(
              (state) => state.maybeMap(
                orElse: () => testNewsEntity,
                success: (s) => s.news,
              ),
              'news entity',
              testNewsEntity,
            ),
      ],
      verify: (_) {
        verify(mockGetNewsDetailUseCase.call(any)).called(1);
      },
    );

    blocTest<NewsDetailsBloc, NewsDetailsState>(
      'emits multiple success states when stream emits multiple values',
      setUp: () {
        final secondNewsEntity = NewsEntity(
          source: SourceEntity(id: '2', name: 'Second Source'),
          author: 'Second Author',
          title: 'Second Title',
          description: 'Second Description',
          url: testUrl,
          urlToImage: 'https://example.com/image2.jpg',
          publishedAt: DateTime.now(),
          content: 'Second Content',
          cachedAt: DateTime.now(),
          isFeatured: true,
        );

        when(mockGetNewsDetailUseCase.call(any)).thenAnswer(
          (_) => Stream.fromIterable([testNewsEntity, secondNewsEntity]),
        );
      },
      build: () =>
          NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase),
      act: (bloc) =>
          bloc.add(const NewsDetailsEvent.detailLoaded(url: testUrl)),
      expect: () => [
        isA<NewsDetailsState>()
            .having(
              (state) =>
                  state.maybeMap(orElse: () => false, success: (_) => true),
              'is success state',
              true,
            )
            .having(
              (state) => state.maybeMap(
                orElse: () => testNewsEntity,
                success: (s) => s.news,
              ),
              'first news entity',
              testNewsEntity,
            ),
        isA<NewsDetailsState>()
            .having(
              (state) =>
                  state.maybeMap(orElse: () => false, success: (_) => true),
              'is success state',
              true,
            )
            .having(
              (state) => state.maybeMap(
                orElse: () => testNewsEntity,
                success: (s) => s.news,
              ),
              'second news entity',
              isA<NewsEntity>()
                  .having((news) => news.source.id, 'source id', '2')
                  .having((news) => news.author, 'author', 'Second Author')
                  .having((news) => news.title, 'title', 'Second Title'),
            ),
      ],
    );

    blocTest<NewsDetailsBloc, NewsDetailsState>(
      'handles use case exception gracefully',
      setUp: () {
        when(
          mockGetNewsDetailUseCase.call(any),
        ).thenAnswer((_) => Stream.error(Exception('Network error')));
      },
      build: () =>
          NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase),
      act: (bloc) =>
          bloc.add(const NewsDetailsEvent.detailLoaded(url: testUrl)),
      errors: () => [isA<Exception>()],
      verify: (_) {
        verify(mockGetNewsDetailUseCase.call(any)).called(1);
      },
    );

    blocTest<NewsDetailsBloc, NewsDetailsState>(
      'handles empty stream',
      setUp: () {
        when(
          mockGetNewsDetailUseCase.call(any),
        ).thenAnswer((_) => Stream.empty());
      },
      build: () =>
          NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase),
      act: (bloc) =>
          bloc.add(const NewsDetailsEvent.detailLoaded(url: testUrl)),
      expect: () => [],
      verify: (_) {
        verify(mockGetNewsDetailUseCase.call(any)).called(1);
      },
    );

    blocTest<NewsDetailsBloc, NewsDetailsState>(
      'correctly passes URL parameter to use case',
      setUp: () {
        when(
          mockGetNewsDetailUseCase.call(any),
        ).thenAnswer((_) => Stream.value(testNewsEntity));
      },
      build: () =>
          NewsDetailsBloc(getNewsDetailUseCase: mockGetNewsDetailUseCase),
      act: (bloc) =>
          bloc.add(const NewsDetailsEvent.detailLoaded(url: testUrl)),
      expect: () => [
        isA<NewsDetailsState>().having(
          (state) => state.maybeMap(orElse: () => false, success: (_) => true),
          'is success state',
          true,
        ),
      ],
      verify: (_) {
        final captured = verify(
          mockGetNewsDetailUseCase.call(captureAny),
        ).captured;
        final params = captured.first as FetchNewsDetailParams;
        expect(params.url, equals(testUrl));
      },
    );

    test('does not have handler for started event', () {
      final bloc = NewsDetailsBloc(
        getNewsDetailUseCase: mockGetNewsDetailUseCase,
      );

      expect(
        () => bloc.add(const NewsDetailsEvent.started()),
        throwsA(isA<StateError>()),
      );

      verifyNever(mockGetNewsDetailUseCase.call(any));
    });
  });
}
