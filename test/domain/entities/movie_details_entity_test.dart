import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';

import '../../mocks/movie_details_mock.dart';

void main() {
  final MovieDetailsEntity movieDetailsEntity =
      MovieDetailsMock.movieDetaislEntity;

  test('should return size of props', () {
    expect(movieDetailsEntity.props.length, 7);
  });

  test('should check consistency of props', () {
    expect(movieDetailsEntity, isA<MovieDetailsEntity>());
  });
}
