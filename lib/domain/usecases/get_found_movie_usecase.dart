import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart';

@lazySingleton
class GetFoundMovieUsecase
    extends Usecase<List<MovieEntity>, GetFoundMovieParams> {
  final MovieRepositoryAbs _repository;

  GetFoundMovieUsecase({
    required MovieRepositoryAbs repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    GetFoundMovieParams params,
  ) =>
      _repository.searchMovie(nameMovie: params.nameMovie);
}

class GetFoundMovieParams extends Equatable {
  const GetFoundMovieParams({required this.nameMovie});

  final String nameMovie;

  @override
  List<Object?> get props => [nameMovie];
}
