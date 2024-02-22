import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchmovies/domain/entities/movie.dart';
import 'package:watchmovies/presentation/providers/movies/movies_providers.dart';

final movieSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovie = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovie.isEmpty) return [];

  return nowPlayingMovie.sublist(0, 6);
});
