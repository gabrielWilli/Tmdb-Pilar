import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_pilar/data/models/cast_model.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/cast_mock.dart';

void main() {
  late CastModel castModel = CastMock.castModel;

  test('should be a subclass of CastEntity', () {
    expect(castModel, isA<CastEntity>());
  });
  test('should return size of props', () {
    expect(castModel.props.length, 1);
  });

  test('should return a valid CastModel fromJson instance', () {
    final json = jsonDecode(fixture("cast.json"));

    final result = CastModel.fromJson((json["cast"] as List).first);

    expect(result, isA<CastModel>());
    expect(result, castModel);
  });
}
