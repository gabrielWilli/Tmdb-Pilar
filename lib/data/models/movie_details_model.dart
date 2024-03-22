import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';

class MovieDetaislModel extends MovieDetailsEntity {
  const MovieDetaislModel({
    required super.isAdult,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.status,
    required super.voteAverage,
  });

  @override
  List<Object?> get props => [
        isAdult,
        title,
        overview,
        posterPath,
        releaseDate,
        status,
        voteAverage,
      ];

  factory MovieDetaislModel.fromJson(Map<String, dynamic> json) =>
      MovieDetaislModel(
        isAdult: json['adult'],
        title: json['title'],
        overview: json['overview'],
        posterPath: "https://image.tmdb.org/t/p/original${json['poster_path']}",
        releaseDate: json['release_date'],
        status: json['status'],
        voteAverage: json['vote_average'],
      );
}
