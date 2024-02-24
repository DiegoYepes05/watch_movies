import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchmovies/presentation/providers/movies/initial_loading_provider.dart';
import 'package:watchmovies/presentation/providers/providers.dart';

import 'package:watchmovies/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-movies';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRaterMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoading();

    final nowPlayingMovie = ref.watch(nowPlayingMoviesProvider);
    final popularMovie = ref.watch(popularMoviesProvider);
    final topRaterMovie = ref.watch(topRaterMoviesProvider);
    final upComingMovie = ref.watch(upComingMoviesProvider);

    final sliderShow = ref.watch(movieSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: sliderShow),
                  MoviesHorizontalListview(
                    movies: nowPlayingMovie,
                    title: 'Cine',
                    subTitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: upComingMovie,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(upComingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: popularMovie,
                    title: 'populares',
                    // subTitle: 'En este mes',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: topRaterMovie,
                    title: 'Mejor calificadas',
                    loadNextPage: () => ref
                        .read(topRaterMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
