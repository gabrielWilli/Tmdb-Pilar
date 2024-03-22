import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/usecases/get_found_movie_usecase.dart';
import 'package:tmdb_pilar/presentation/search/bloc/search_event.dart';

@singleton
class SearchBloc extends Bloc<SearchEvent, BlocState> {
  final GetFoundMovieUsecase _getFoundMovieUsecase;

  SearchBloc({
    required GetFoundMovieUsecase getFoundMovieUsecase,
  })  : _getFoundMovieUsecase = getFoundMovieUsecase,
        super(const BlocStateInitial()) {
    on<GetFoundMovieEvent>(_foundMovie);
  }

  Future<void> _foundMovie(
    GetFoundMovieEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(const BlocStateLoading());

    final result = await _getFoundMovieUsecase(
      GetFoundMovieParams(
        nameMovie: event.movieName,
      ),
    );

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
