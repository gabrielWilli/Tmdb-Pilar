import 'package:tmdb_pilar/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  const CastModel({
    required super.profilePath,
  });

  @override
  List<Object?> get props => [profilePath];

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        profilePath: json['profile_path'] != null
            ? "https://image.tmdb.org/t/p/original${json['profile_path']}"
            : '',
      );
}
