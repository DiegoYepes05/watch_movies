import 'package:watchmovies/domain/datasources/movies_datasource.dart';
import 'package:watchmovies/domain/entities/movie.dart';
import 'package:watchmovies/domain/repositories/movies_repository.dart';

class MoviesRepositoriesImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoriesImpl(
    this.datasource,
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
