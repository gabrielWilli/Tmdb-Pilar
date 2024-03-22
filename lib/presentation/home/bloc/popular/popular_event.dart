import 'package:equatable/equatable.dart';

sealed class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class GetListPopularEvent extends PopularMovieEvent {}
