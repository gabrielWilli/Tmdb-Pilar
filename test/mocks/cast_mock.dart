import 'package:tmdb_pilar/data/models/cast_model.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';

class CastMock {
  static CastModel get castModel => const CastModel(
        profilePath:
            'https://image.tmdb.org/t/p/original/qSizF2i9gz6c6DbAC5RoIq8sVqX.jpg',
      );

  static CastModel get castModelEmpty => const CastModel(
        profilePath: '',
      );

  static CastEntity get castEntity => const CastEntity(
        profilePath:
            'https://image.tmdb.org/t/p/original/qSizF2i9gz6c6DbAC5RoIq8sVqX.jpg',
      );
}
