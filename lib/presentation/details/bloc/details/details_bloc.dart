import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';
import 'package:tmdb_pilar/domain/usecases/get_details_movie_usecase.dart';
import 'package:tmdb_pilar/presentation/details/bloc/details/details_event.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, BlocState> {
  final GetDetailsMovieUsecase _detailsMovieUsecase;

  DetailsBloc({
    required GetDetailsMovieUsecase getDetailsMovieUsecase,
  })  : _detailsMovieUsecase = getDetailsMovieUsecase,
        super(const BlocStateInitial()) {
    on<GetDetailsEvent>(_getDetailsMovie);
  }

  Future<void> _getDetailsMovie(
    GetDetailsEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(const BlocStateLoading());

    final result = await _detailsMovieUsecase(
      GetDetailsMovieParams(
        movieId: event.movieId,
      ),
    );

    emit(
      result.fold(
        (failure) => BlocStateFailure(failure),
        (response) => BlocStateSuccess<MovieDetailsEntity>(value: response),
      ),
    );
  }
}
