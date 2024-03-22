import 'package:tmdb_pilar/data/models/movie_model.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';

class MovieMock {
  static MovieModel get movieModel => const MovieModel(
        id: 1011985,
        posterPath: 'https://image.tmdb.org/t/p/original/wkfG7DaExmcVsGLR4kLouMwxeT5.jpg',
        backdropPath: 'https://image.tmdb.org/t/p/original/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg',
        title: 'Kung Fu Panda 4',
        voteAverage: 6.9,
        overview: 'Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.',
      );

  static MovieEntity get movieEntity => const MovieEntity(
        id: 1011985,
        posterPath: 'https://image.tmdb.org/t/p/original/wkfG7DaExmcVsGLR4kLouMwxeT5.jpg',
        backdropPath: 'https://image.tmdb.org/t/p/original/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg',
        title: 'Kung Fu Panda 4',
        voteAverage: 6.9,
        overview: 'Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.',
      );

    
}
