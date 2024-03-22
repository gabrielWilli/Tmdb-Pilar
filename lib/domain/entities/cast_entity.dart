import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  const CastEntity({required this.profilePath});

  final String? profilePath;

  @override
  List<Object?> get props => [profilePath];
}
