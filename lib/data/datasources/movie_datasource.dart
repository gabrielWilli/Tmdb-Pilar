import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/http/http_service.dart';
import 'package:tmdb_pilar/core/utils/constants/constants.dart';
import 'package:tmdb_pilar/data/models/cast_model.dart';
import 'package:tmdb_pilar/data/models/movie_details_model.dart';
import 'package:tmdb_pilar/data/models/movie_model.dart';

abstract class MovieDatasourceAbs {
  Future<List<MovieModel>> getListMoviePopular();
  Future<List<MovieModel>> getListMovieTopRated();
  Future<MovieDetaislModel> getDetailsMovie({
    required int movieId,
  });
  Future<List<CastModel>> getCast({
    required int movieId,
  });
  Future<List<MovieModel>> searchMovie({
    required String nameMovie,
  });
}

@LazySingleton(as: MovieDatasourceAbs)
class MovieDatasource implements MovieDatasourceAbs {
  MovieDatasource({
    required RestClientAbs restClientAbs,
  }) : _restClientAbs = restClientAbs;

  final RestClientAbs _restClientAbs;

  @override
  Future<List<MovieModel>> getListMoviePopular() async {
    try {
      final data = await _restClientAbs.get(
        url: urlPopular,
        token: const String.fromEnvironment(
          "TOKEN_TMDB",
          defaultValue: '',
        ),
      );

      if ((data['results'] as List).isEmpty) <MovieModel>[];

      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getListMovieTopRated() async {
    try {
      final data = await _restClientAbs.get(
        url: urlTopRated,
        token: const String.fromEnvironment("TOKEN_TMDB", defaultValue: ''),
      );

      if ((data['results'] as List).isEmpty) <MovieModel>[];

      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetaislModel> getDetailsMovie({required int movieId}) async {
    try {
      final data = await _restClientAbs.get(
        url: '$baseUrl/movie/$movieId',
        token: const String.fromEnvironment(
          "TOKEN_TMDB",
          defaultValue: '',
        ),
      );

      if (data == null) <MovieDetaislModel>[];

      return MovieDetaislModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CastModel>> getCast({required int movieId}) async {
    try {
      final data = await _restClientAbs.get(
        url: '$baseUrl/movie/$movieId/credits',
        token: const String.fromEnvironment(
          "TOKEN_TMDB",
          defaultValue: '',
        ),
      );

      if ((data['cast'] as List).isEmpty) <MovieDetaislModel>[];

      return (data['cast'] as List)
          .map((movie) => CastModel.fromJson(movie))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> searchMovie({required String nameMovie}) async {
    try {
      final data = await _restClientAbs.get(
        url: '$baseUrl/search/movie?query=$nameMovie',
        token: const String.fromEnvironment(
          "TOKEN_TMDB",
          defaultValue: '',
        ),
      );

      if ((data['results'] as List).isEmpty) <MovieModel>[];

      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
