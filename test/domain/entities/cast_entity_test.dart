import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';

import '../../mocks/cast_mock.dart';

void main() {
  final CastEntity castEntity = CastMock.castEntity;

  test('should return size of props', () {
    expect(castEntity.props.length, 1);
  });

  test('should check consistency of props', () {
    expect(castEntity, isA<CastEntity>());
  });
}
