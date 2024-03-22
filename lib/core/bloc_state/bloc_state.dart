import 'package:equatable/equatable.dart';

class BlocStateNoValue {}

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object?> get props => [];
}

class BlocStateInitial extends BlocState {
  const BlocStateInitial();
}

class BlocStateLoading<BlocStateLoadingValue> extends BlocState {
  final BlocStateLoadingValue? value;

  const BlocStateLoading({this.value});

  @override
  List<Object?> get props => [value];
}

class BlocStateEmpty<BlocStateEmptyValue> extends BlocState {
  final BlocStateEmptyValue? value;

  const BlocStateEmpty({this.value});

  @override
  List<Object?> get props => [value];
}

class BlocStateSuccess<BlocStateSuccessValue> extends BlocState {
  final BlocStateSuccessValue? value;

  const BlocStateSuccess({this.value});

  @override
  List<Object?> get props => [value];
}

class BlocStateFailure<Failure> extends BlocState {
  final Failure? failure;

  const BlocStateFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
