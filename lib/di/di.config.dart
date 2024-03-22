// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tmdb_pilar/core/http/http_service.dart' as _i5;
import 'package:tmdb_pilar/core/network/network_info.dart' as _i3;
import 'package:tmdb_pilar/data/datasources/movie_datasource.dart' as _i6;
import 'package:tmdb_pilar/data/repositories/movie_repository_impl.dart' as _i8;
import 'package:tmdb_pilar/di/modules/http/http_module.dart' as _i19;
import 'package:tmdb_pilar/domain/repositories/movie_repository.dart' as _i7;
import 'package:tmdb_pilar/domain/usecases/get_details_movie_usecase.dart'
    as _i10;
import 'package:tmdb_pilar/domain/usecases/get_found_movie_usecase.dart'
    as _i12;
import 'package:tmdb_pilar/domain/usecases/get_list_cast_usecase.dart' as _i14;
import 'package:tmdb_pilar/domain/usecases/get_movies_popular_usecase.dart'
    as _i9;
import 'package:tmdb_pilar/domain/usecases/get_movies_top_rated_usecase.dart'
    as _i11;
import 'package:tmdb_pilar/presentation/details/bloc/cast/cast_bloc.dart'
    as _i15;
import 'package:tmdb_pilar/presentation/details/bloc/details/details_bloc.dart'
    as _i18;
import 'package:tmdb_pilar/presentation/home/bloc/popular/popular_bloc.dart'
    as _i16;
import 'package:tmdb_pilar/presentation/home/bloc/top_rated/top_rated_bloc.dart'
    as _i17;
import 'package:tmdb_pilar/presentation/search/bloc/search_bloc.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpModule = _$HttpModule();
    gh.lazySingleton<_i3.NetworkInfoAbs>(() => _i3.NetworkInfo());
    gh.singleton<_i4.Client>(
      () => httpModule.httpClient,
      instanceName: 'http',
    );
    gh.factory<_i5.RestClientAbs>(
        () => _i5.HttpService(gh<_i4.Client>(instanceName: 'http')));
    gh.lazySingleton<_i6.MovieDatasourceAbs>(
        () => _i6.MovieDatasource(restClientAbs: gh<_i5.RestClientAbs>()));
    gh.lazySingleton<_i7.MovieRepositoryAbs>(() => _i8.MovieRepositoryImpl(
          networkInfo: gh<_i3.NetworkInfoAbs>(),
          movieDatasourceAbs: gh<_i6.MovieDatasourceAbs>(),
        ));
    gh.lazySingleton<_i9.GetMoviesPopularUsecase>(() =>
        _i9.GetMoviesPopularUsecase(repository: gh<_i7.MovieRepositoryAbs>()));
    gh.lazySingleton<_i10.GetDetailsMovieUsecase>(() =>
        _i10.GetDetailsMovieUsecase(repository: gh<_i7.MovieRepositoryAbs>()));
    gh.lazySingleton<_i11.GetMovieTopRatedUsecase>(() =>
        _i11.GetMovieTopRatedUsecase(repository: gh<_i7.MovieRepositoryAbs>()));
    gh.lazySingleton<_i12.GetFoundMovieUsecase>(() =>
        _i12.GetFoundMovieUsecase(repository: gh<_i7.MovieRepositoryAbs>()));
    gh.singleton<_i13.SearchBloc>(() =>
        _i13.SearchBloc(getFoundMovieUsecase: gh<_i12.GetFoundMovieUsecase>()));
    gh.lazySingleton<_i14.GetListCastUsecase>(() => _i14.GetListCastUsecase(
        movieRepositoryAbs: gh<_i7.MovieRepositoryAbs>()));
    gh.factory<_i15.CastBloc>(
        () => _i15.CastBloc(getListCastUsecase: gh<_i14.GetListCastUsecase>()));
    gh.factory<_i16.PopularBloc>(() => _i16.PopularBloc(
        getMoviesPopularUsecase: gh<_i9.GetMoviesPopularUsecase>()));
    gh.factory<_i17.TopRatedBloc>(() => _i17.TopRatedBloc(
        getMovieTopRatedUsecase: gh<_i11.GetMovieTopRatedUsecase>()));
    gh.factory<_i18.DetailsBloc>(() => _i18.DetailsBloc(
        getDetailsMovieUsecase: gh<_i10.GetDetailsMovieUsecase>()));
    return this;
  }
}

class _$HttpModule extends _i19.HttpModule {}
