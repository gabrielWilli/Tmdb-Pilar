import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/data/models/movie_details_model.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/movie_details_mock.dart';

void main() {
  late MovieDetaislModel movieDetailsMock = MovieDetailsMock.movieDetaislModel;

  test('should be a subclass of CastEntity', () {
    expect(movieDetailsMock, isA<MovieDetailsEntity>());
  });
  test('should return size of props', () {
    expect(movieDetailsMock.props.length, 7);
  });

  test('should return a valid MovieDetaislModel fromJson instance', () {
    final json = jsonDecode(fixture('details_movie.json'));

    final result = MovieDetaislModel.fromJson(json);

    expect(result, isA<MovieDetaislModel>());
    expect(result, movieDetailsMock);
  });
}
