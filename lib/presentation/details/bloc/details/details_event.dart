import 'package:equatable/equatable.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailsEvent extends DetailsEvent {
  const GetDetailsEvent({required this.movieId});

  final int movieId;

  @override
  List<Object> get props => [movieId];
}
