import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/core/ui/widgets/no_data_widget.dart';
import 'package:news/features/news/domain/entities/news/news_entity.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';
import 'package:news/features/news/presentation/pages/details_page.dart';
import 'package:news/features/news/presentation/widgets/widgets.dart';
import 'package:news/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:news/injection/injection_container.dart';
import 'package:news/config/themes/app_theme_mode.dart';

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
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  onPressed: () => _showThemePicker(context),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('News'),
                centerTitle: false,
                titlePadding: const .only(left: 20),
              ),
            ),

            SliverToBoxAdapter(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(child: Text('Pull to refresh')),
                    loading: () => Center(child: CircularProgressIndicator()),
                    error: (message) => const SizedBox.shrink(),
                    success: (news, hasReachedMax, _) {
                      return Column(
                        crossAxisAlignment: .start,
                        children: [
                          const SectionTitle(title: 'Top News'),
                          SizedBox(
                            height: 200,
                            child: CarouselView(
                              controller: _carouselController,
                              itemExtent: 300,
                              children: news
                                  .map((news) => TopNewsWidget(newsData: news))
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
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
                  error: (message) => _errorNewsListView(message, context),
                  success: _successNewsListView,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // MARK: Error View on List
  SliverFillRemaining _errorNewsListView(String message, BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        spacing: 30,
        mainAxisAlignment: .center,
        children: [
          Text(
            'Error: $message',
            textAlign: .center,
            style: context.textTheme.titleSmall,
          ),
          FilledButton(
            onPressed: () {
              context.read<NewsBloc>().add(const .newsRefreshed());
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  // MARK: News List View
  Widget _successNewsListView(
    List<NewsEntity> news,
    bool hasReachedMax,
    bool isMoreLoading,
  ) {
    if (news.isEmpty) {
      return const SliverFillRemaining(
        child: NoDataWidget(title: 'No News yet.'),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverList.separated(
        itemCount: news.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsPage.route,
                    arguments: news[index].url,
                  );
                },
                child: NewsTile(newsData: news[index]),
              ),

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
  }

  void _showThemePicker(BuildContext context) {
    final current = context.read<ThemeBloc>().state.themeMode;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: RadioGroup<AppThemeMode>(
          groupValue: current,
          onChanged: (m) {
            if (m != null) {
              context.read<ThemeBloc>().add(ThemeEvent.themeUpdated(m));
            }
            Navigator.of(ctx).pop();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: AppThemeMode.values.map((mode) {
              return RadioListTile<AppThemeMode>(
                title: Text(
                  mode.name[0].toUpperCase() + mode.name.substring(1),
                ),
                value: mode,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
