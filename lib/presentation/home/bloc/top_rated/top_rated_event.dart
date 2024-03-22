import 'package:equatable/equatable.dart';

sealed class TopRatedEvent extends Equatable {
  const TopRatedEvent();

  @override
  List<Object> get props => [];
}

class GetListTopRatedEvent extends TopRatedEvent {}
