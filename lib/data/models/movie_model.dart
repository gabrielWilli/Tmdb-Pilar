import 'package:tmdb_pilar/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.posterPath,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.overview,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        backdropPath,
        title,
        voteAverage,
        overview,
      ];

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        posterPath: 'https://image.tmdb.org/t/p/original${json['poster_path']}',
        backdropPath:
            'https://image.tmdb.org/t/p/original${json['backdrop_path']}',
        title: json['title'],
        voteAverage: (json['vote_average'] as double),
        overview: json['overview'],
      );
}
