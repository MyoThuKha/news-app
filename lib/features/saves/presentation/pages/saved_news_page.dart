import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:news/features/news/presentation/pages/details_page.dart';
import 'package:news/features/saves/domain/entities/saved_news_entity.dart';
import 'package:news/features/saves/presentation/bloc/saved_news_bloc.dart';
import 'package:news/features/saves/presentation/widgets/saved_news_tile.dart';
import 'package:news/injection/injection_container.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  static const String route = '/saved';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SavedNewsBloc>()..add(const .savesLoaded()),
      child: const _SavedNewsView(),
    );
  }
}

class _SavedNewsView extends StatefulWidget {
  const _SavedNewsView();

  @override
  State<_SavedNewsView> createState() => _SavedNewsViewState();
}

class _SavedNewsViewState extends State<_SavedNewsView> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            collapsedHeight: 60,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Saved News'),
              centerTitle: false,
              titlePadding: const .only(left: 20),
            ),
          ),
      
      
          // MARK: Saved News Section
          BlocBuilder<SavedNewsBloc, SavedNewsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () =>
                    const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (message) => _errorView(message, context),
                success: _successView,
              );
            },
          ),
        ],
      ),
    );
  }


  SliverFillRemaining _errorView(String message, BuildContext context) {
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
        ],
      ),
    );
  }

  SliverPadding _successView(List<SavedNewsEntity> news) {
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
                    arguments: news[index].news.url,
                  );
                },
                child: SavedNewsTile(newsData: news[index]),
              ),
            ],
          );
        },
      ),
    );
  }
}
