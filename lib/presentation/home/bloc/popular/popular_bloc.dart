import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/core/usecase/usecase.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/domain/usecases/get_movies_popular_usecase.dart';
import 'package:tmdb_pilar/presentation/home/bloc/popular/popular_event.dart';

@injectable
class PopularBloc extends Bloc<PopularMovieEvent, BlocState> {
  final GetMoviesPopularUsecase _getMoviesPopularUsecase;

  PopularBloc({
    required GetMoviesPopularUsecase getMoviesPopularUsecase,
  })  : _getMoviesPopularUsecase = getMoviesPopularUsecase,
        super(const BlocStateInitial()) {
    on<GetListPopularEvent>(_getListPopularMovie);
  }

  Future<void> _getListPopularMovie(
    GetListPopularEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(const BlocStateLoading());

    final result = await _getMoviesPopularUsecase(const NoParams());

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
