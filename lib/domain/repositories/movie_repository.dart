import 'package:dartz/dartz.dart';
import 'package:tmdb_pilar/core/error/error.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';

abstract class MovieRepositoryAbs {
  Future<Either<Failure, List<MovieEntity>>> getListMoviePopular();
  Future<Either<Failure, List<MovieEntity>>> getListMovieTopRated();
  Future<Either<Failure, MovieDetailsEntity>> getDetailsMovie({
    required int movieId,
  });
  Future<Either<Failure, List<CastEntity>>> getCast({
    required int movieId,
  });
  Future<Either<Failure, List<MovieEntity>>> searchMovie({
    required String nameMovie,
  });
}
