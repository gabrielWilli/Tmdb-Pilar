import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart';

@lazySingleton
class GetDetailsMovieUsecase
    extends Usecase<MovieDetailsEntity, GetDetailsMovieParams> {
  final MovieRepositoryAbs _repository;

  GetDetailsMovieUsecase({
    required MovieRepositoryAbs repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
    GetDetailsMovieParams params,
  ) =>
      _repository.getDetailsMovie(movieId: params.movieId);
}

class GetDetailsMovieParams extends Equatable {
  const GetDetailsMovieParams({required this.movieId});

  final int movieId;

  @override
  List<Object?> get props => [movieId];
}
