import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/data/models/movie_model.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/movie_mock.dart';

void main() {
  late MovieModel movieModelMock = MovieMock.movieModel;

  test('should be a subclass of CastEntity', () {
    expect(movieModelMock, isA<MovieEntity>());
  });

  test('should return size of props', () {
    expect(movieModelMock.props.length, 6);
  });

  test('should return a valid MovieModel fromJson instance', () {
    final Map json = jsonDecode(fixture('movie.json'));

    final result = MovieModel.fromJson((json["results"] as List).first);

    expect(result, isA<MovieModel>());
    expect(result, movieModelMock);
  });
}
