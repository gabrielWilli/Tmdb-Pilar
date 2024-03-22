import 'package:tmdb_pilar/data/models/movie_details_model.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';

class MovieDetailsMock {
  static MovieDetaislModel get movieDetaislModel => const MovieDetaislModel(
        isAdult: false,
        title: 'Four Rooms',
        overview:
            'It\u2019s Ted the Bellhop\u2019s first night on the job...and the hotel\u2019s very unusual guests are about to place him in some outrageous predicaments. It seems that this evening\u2019s room service is serving up one unbelievable happening after another.',
        posterPath:
            'https://image.tmdb.org/t/p/original/75aHn1NOYXh4M7L5shoeQ6NGykP.jpg',
        releaseDate: '1995-12-09',
        status: 'Released',
        voteAverage: 5.82,
      );

  static MovieDetailsEntity get movieDetaislEntity => const MovieDetailsEntity(
        isAdult: false,
        title: 'title',
        overview: 'overview',
        posterPath:
            'https://image.tmdb.org/t/p/original/75aHn1NOYXh4M7L5shoeQ6NGykP.jpg',
        releaseDate: '2024-03-02',
        status: 'status',
        voteAverage: 6.9,
      );
}
