import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart';

@lazySingleton
class GetListCastUsecase extends Usecase<List<CastEntity>, GetListCastParams> {
  GetListCastUsecase({
    required MovieRepositoryAbs movieRepositoryAbs,
  }) : _movieRepositoryAbs = movieRepositoryAbs;

  final MovieRepositoryAbs _movieRepositoryAbs;

  @override
  Future<Either<Failure, List<CastEntity>>> call(params) =>
      _movieRepositoryAbs.getCast(movieId: params.movieId);
}

class GetListCastParams extends Equatable {
  const GetListCastParams({required this.movieId});

  final int movieId;

  @override
  List<Object?> get props => [movieId];
}
