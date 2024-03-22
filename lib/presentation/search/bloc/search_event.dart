import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetFoundMovieEvent extends SearchEvent {
  const GetFoundMovieEvent({required this.movieName});

  final String movieName;

  @override
  List<Object> get props => [movieName];
}
