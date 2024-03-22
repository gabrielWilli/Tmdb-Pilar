import 'package:equatable/equatable.dart';

sealed class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class GetListCastEvent extends CastEvent {
  const GetListCastEvent({required this.movieId});

  final int movieId;

  @override
  List<Object> get props => [movieId];
}
