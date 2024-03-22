import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart';

@lazySingleton
class GetMovieTopRatedUsecase implements Usecase<List<MovieEntity>, NoParams> {
  final MovieRepositoryAbs _repository;

  GetMovieTopRatedUsecase({
    required MovieRepositoryAbs repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async =>
      await _repository.getListMovieTopRated();
}
