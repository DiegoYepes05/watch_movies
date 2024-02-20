import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchmovies/infrastructure/datasources/moviedb_datasource.dart';
import 'package:watchmovies/infrastructure/repository/movies_repositories_impl.dart';

final moviesRepositoryProvider = Provider((ref) {
  return MoviesRepositoriesImpl(MoviedbDatasource());
});
