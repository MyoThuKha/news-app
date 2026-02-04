import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/date_format_util.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/presentation/bloc/news_details/news_details_bloc.dart';
import 'package:news/features/news/presentation/widgets/last_updated_timestamp.dart';
import 'package:news/features/saves/presentation/bloc/save_status/save_status_bloc.dart';
import 'package:news/injection/injection_container.dart';
import 'package:news/core/ui/extensions/context_extensions.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const String route = '/details';

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final url = arg['url'] as String;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<NewsDetailsBloc>()..add(.detailLoaded(url: url)),
        ),
        BlocProvider(
          create: (context) {
            return sl<SaveStatusBloc>()..add(.saveStatusLoaded(url: url));
          }
        ),
      ],
      child: BlocListener<SaveStatusBloc, SavedStatusState>(
        listenWhen: (previous, current) =>
            current.maybeWhen(updated: (_) => true, orElse: () => false),
        listener: (context, state) {
          state.maybeWhen(
            updated: (isSaved) {
              final message = isSaved
                  ? 'Saved to favorites'
                  : 'Removed from favorites';
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
          // show snackbar
        },
        child: const _DetailView(),
      ),
    );
  }
}

class _DetailView extends StatefulWidget {
  const _DetailView();

  @override
  State<_DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<_DetailView> {

  late final String url;
  late final bool fromCache;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    url = arg['url'] as String;
    fromCache = arg['fromCache'] as bool;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (news) => _buildSuccessView(context, news),
          );
        },
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context, NewsEntity newsData) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          foregroundColor: context.colorScheme.primaryContainer,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: .parallax,
            background: Hero(
              tag: newsData.urlToImage,
              child: CachedNetworkImage(
                imageUrl: newsData.urlToImage,
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.4),
                colorBlendMode: .darken,
              ),
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () {
                context.read<SaveStatusBloc>().add(.saveToggled(newsData));
              },
              child: BlocBuilder<SaveStatusBloc, SavedStatusState>(
                builder: (context, state) {

                  const savedIcon = Icon(Icons.favorite);
                  const notSavedIcon = Icon(Icons.favorite_border);

                  return state.maybeWhen(
                    success: (isSaved) => isSaved ? savedIcon : notSavedIcon,
                    updated: (isSaved) => isSaved ? savedIcon : notSavedIcon,
                    orElse: () => notSavedIcon,
                  );
                },
              ),
            ),
            const SizedBox(width: 10),

            if (url.isNotEmpty)
              FilledButton(
                onPressed: () => _onShare(context),
                child: const Icon(Icons.share),
              ),
          ],
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const .all(10),
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              children: [

                if (fromCache)
                  Align(
                    alignment: .topRight,
                    child: LastUpdatedTimestamp(timestamp: newsData.cachedAt),
                  ),

                // MARK: Title
                Text(
                  newsData.title,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),

                // MARK: Source and published date
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    if (newsData.source.name.isNotEmpty)
                      Text(
                        newsData.source.name,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    if (newsData.publishedAt != null)
                      Text(
                        DateFormatUtil.toLocalReadable(newsData.publishedAt),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                  ],
                ),

                // MARK: Description
                Text(
                  newsData.description,
                  style: context.textTheme.bodyLarge?.copyWith(
                    height: 2,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),

                Text(
                  newsData.content,
                  style: context.textTheme.bodyLarge?.copyWith(
                    height: 2,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),

                SizedBox(height: context.viewsPaddingOf.bottom),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onShare(BuildContext context) {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share. URL is invalid.')),
      );
      return;
    }

    SharePlus.instance.share(ShareParams(uri: uri));
  }
}
