import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovie = ref.watch(nowPlayingMoviesProvider);
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
                    movies: nowPlayingMovie,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: nowPlayingMovie,
                    title: 'populares',
                    // subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MoviesHorizontalListview(
                    movies: nowPlayingMovie,
                    title: 'Mejor ranqueadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  SizedBox(
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
