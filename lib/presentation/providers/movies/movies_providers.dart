import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchmovies/domain/entities/movie.dart';
import 'package:watchmovies/presentation/providers/movies/movies_repositories_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currenPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currenPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currenPage);

    state = [...state, ...movies];
  }
}