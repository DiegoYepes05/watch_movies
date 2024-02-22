import 'package:dio/dio.dart';
import 'package:watchmovies/config/constants/environment.dart';
import 'package:watchmovies/domain/datasources/movies_datasource.dart';
import 'package:watchmovies/domain/entities/movie.dart';
import 'package:watchmovies/infrastructure/mappers/movie_mappers.dart';
import 'package:watchmovies/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });

    final moviedbResponse = MoviedbRepsonse.fromJson(response.data);

    final List<Movie> movies = moviedbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMappers.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
