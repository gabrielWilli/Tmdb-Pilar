import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/usecases/get_movies_top_rated_usecase.dart';
import 'package:tmdb_pilar/presentation/home/bloc/top_rated/top_rated_event.dart';

@injectable
class TopRatedBloc extends Bloc<TopRatedEvent, BlocState> {
  final GetMovieTopRatedUsecase _getMovieTopRatedUsecase;

  TopRatedBloc({
    required GetMovieTopRatedUsecase getMovieTopRatedUsecase,
  })  : _getMovieTopRatedUsecase = getMovieTopRatedUsecase,
        super(const BlocStateInitial()) {
    on<GetListTopRatedEvent>(_getListMovieTopRated);
  }

  Future<void> _getListMovieTopRated(
    GetListTopRatedEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(const BlocStateLoading());

    final result = await _getMovieTopRatedUsecase(const NoParams());

    emit(
      result.fold(
        (failure) => BlocStateFailure(failure),
        (response) => response.isEmpty
            ? const BlocStateEmpty()
            : BlocStateSuccess<List<MovieEntity>>(value: response),
      ),
    );
  }
}
