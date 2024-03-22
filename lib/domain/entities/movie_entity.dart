import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
  });

  final int id;
  final String posterPath;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final String overview;

  @override
  List<Object?> get props => [
        id,
        posterPath,
        backdropPath,
        title,
        voteAverage,
        overview,
      ];

}
