import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';
import 'package:tmdb_pilar/domain/usecases/get_list_cast_usecase.dart';
import 'package:tmdb_pilar/presentation/details/bloc/cast/cast_event.dart';

@injectable
class CastBloc extends Bloc<CastEvent, BlocState> {
  final GetListCastUsecase _getListCastUsecase;

  CastBloc({
    required GetListCastUsecase getListCastUsecase,
  })  : _getListCastUsecase = getListCastUsecase,
        super(const BlocStateInitial()) {
    on<GetListCastEvent>(_getListCast);
  }

  Future<void> _getListCast(
    GetListCastEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(const BlocStateLoading());

    final result = await _getListCastUsecase(
      GetListCastParams(movieId: event.movieId),
    );

    emit(
      result.fold(
        (failure) => BlocStateFailure(failure),
        (response) => response.isEmpty
            ? const BlocStateEmpty()
            : BlocStateSuccess<List<CastEntity>>(value: response),
      ),
    );
  }
}
