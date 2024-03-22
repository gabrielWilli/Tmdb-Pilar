import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/network/network_info.dart';
import 'package:tmdb_pilar/data/datasources/movie_datasource.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepositoryAbs)
class MovieRepositoryImpl implements MovieRepositoryAbs {
  final NetworkInfoAbs _networkInfo;
  final MovieDatasourceAbs _movieDatasourceAbs;

  MovieRepositoryImpl({
    required NetworkInfoAbs networkInfo,
    required MovieDatasourceAbs movieDatasourceAbs,
  })  : _networkInfo = networkInfo,
        _movieDatasourceAbs = movieDatasourceAbs;

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMovieTopRated() async {
    try {
      if (!await _networkInfo.isConnected()) throw const NoInternetFailure();

      final result = await _movieDatasourceAbs.getListMovieTopRated();

      return Right(result);
    } on HttpFailure catch (_) {
      return const Left(HttpFailure());
    } on NoInternetFailure catch (_) {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopular() async {
    try {
      if (!await _networkInfo.isConnected()) throw const NoInternetFailure();

      final result = await _movieDatasourceAbs.getListMoviePopular();

      return Right(result);
    } on HttpFailure catch (_) {
      return const Left(HttpFailure());
    } on NoInternetFailure catch (_) {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getDetailsMovie({
    required int movieId,
  }) async {
    try {
      if (!await _networkInfo.isConnected()) throw const NoInternetFailure();

      final result =
          await _movieDatasourceAbs.getDetailsMovie(movieId: movieId);

      return Right(result);
    } on HttpFailure catch (_) {
      return const Left(HttpFailure());
    } on NoInternetFailure catch (_) {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<CastEntity>>> getCast({
    required int movieId,
  }) async {
    try {
      if (!await _networkInfo.isConnected()) throw const NoInternetFailure();

      final result = await _movieDatasourceAbs.getCast(movieId: movieId);

      return Right(result);
    } on HttpFailure catch (_) {
      return const Left(HttpFailure());
    } on NoInternetFailure catch (_) {
      return const Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovie({
    required String nameMovie,
  }) async {
    try {
      if (!await _networkInfo.isConnected()) throw const NoInternetFailure();

      final result =
          await _movieDatasourceAbs.searchMovie(nameMovie: nameMovie);

      return Right(result);
    } on HttpFailure catch (_) {
      return const Left(HttpFailure());
    } on NoInternetFailure catch (_) {
      return const Left(NoInternetFailure());
    }
  }
}
