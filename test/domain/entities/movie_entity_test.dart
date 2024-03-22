import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';

import '../../mocks/movie_mock.dart';

void main() {
  final MovieEntity movieEntity = MovieMock.movieEntity;

  test('should return size of props', () {
    expect(movieEntity.props.length, 6);
  });

  test('should check consistency of props', () {
    expect(movieEntity, isA<MovieEntity>());
  });
}
