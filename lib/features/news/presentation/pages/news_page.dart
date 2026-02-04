import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';
import 'package:news/features/news/presentation/widgets/widgets.dart';
import 'package:news/injection/injection_container.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const String route = '/news';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(const .newsLoaded()),
      child: const _NewsView(),
    );
  }
}

class _NewsView extends StatefulWidget {
  const _NewsView();

  @override
  State<_NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<_NewsView> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        edgeOffset: 100,
        onRefresh: () async {
          context.read<NewsBloc>().add(const .newsRefreshed());
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 80,
              collapsedHeight: 60,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('News'),
                centerTitle: false,
                titlePadding: const .only(left: 20),
              ),
            ),

            // MARK: Top Headlines News Section
            SliverToBoxAdapter(child: SectionTitle(title: 'Top News')),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Center(child: Text('Pull to refresh')),
                      loading: () => Center(child: CircularProgressIndicator()),
                      error: (message) => Center(
                        child: Column(
                          spacing: 15,
                          mainAxisAlignment: .center,
                          children: [
                            Text('Error: $message'),
                            FilledButton(
                              onPressed: () {
                                context.read<NewsBloc>().add(
                                  const .newsLoaded(),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                      success: (news, hasReachedMax, _) {
                        return CarouselView(
                          controller: _carouselController,
                          itemExtent: 300,
                          children: news
                              .map((news) => TopNewsWidget(newsData: news))
                              .toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            // MARK: All News Section
            SliverToBoxAdapter(child: SectionTitle(title: 'News')),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverFillRemaining(
                    child: Center(child: Text('Pull to refresh')),
                  ),
                  loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (message) => SliverFillRemaining(
                    child: Center(
                      child: Column(
                        spacing: 15,
                        mainAxisAlignment: .center,
                        children: [
                          Text('Error: $message'),
                          FilledButton(
                            onPressed: () {
                              context.read<NewsBloc>().add(const .newsLoaded());
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  success: (news, hasReachedMax, isMoreLoading) {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      sliver: SliverList.separated(
                        itemCount: news.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              NewsTile(newsData: news[index]),

                              if (index == news.length - 1)
                                Padding(
                                  padding: const .all(16),
                                  child: hasReachedMax
                                      ? const Text('No More Articles.')
                                      : FilledButton(
                                          onPressed: () {
                                            context.read<NewsBloc>().add(
                                              const NewsEvent.loadMore(),
                                            );
                                          },
                                          child: const Text('Load More'),
                                        ),
                                ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
