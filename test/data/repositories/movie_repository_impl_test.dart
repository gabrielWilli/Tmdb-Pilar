import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_pilar/core/error/failures.dart';
import 'package:tmdb_pilar/core/network/network_info.dart';
import 'package:tmdb_pilar/data/datasources/movie_datasource.dart';
import 'package:tmdb_pilar/data/models/cast_model.dart';
import 'package:tmdb_pilar/data/models/movie_details_model.dart';
import 'package:tmdb_pilar/data/models/movie_model.dart';
import 'package:tmdb_pilar/data/repositories/movie_repository_impl.dart';

import '../../mocks/cast_mock.dart';
import '../../mocks/movie_details_mock.dart';
import '../../mocks/movie_mock.dart';

class MockNetworkInfo extends Mock implements NetworkInfoAbs {}

class MockMovieDatasource extends Mock implements MovieDatasourceAbs {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockMovieDatasource mockMovieDatasource;
  late MovieRepositoryImpl movieRepositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockMovieDatasource = MockMovieDatasource();
    movieRepositoryImpl = MovieRepositoryImpl(
      networkInfo: mockNetworkInfo,
      movieDatasourceAbs: mockMovieDatasource,
    );
  });

  final List<MovieModel> tMovieModel = [MovieMock.movieModel];
  final List<CastModel> tCastModel = [CastMock.castModel];
  final MovieDetaislModel tMovieDetailModel =
      MovieDetailsMock.movieDetaislModel;

  const int tMovieId = 5;
  const String tNameMovie = 'Kung';

  group('device is online', () {
    setUp(() {
      when(() => mockNetworkInfo.isConnected()).thenAnswer(
        (_) async => true,
      );
    });
    group('success', () {
      test('should return remote data when searching for movie popular ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getListMoviePopular()).thenAnswer(
          (_) async => tMovieModel,
        );

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getListMoviePopular();

        //Assert - Compare the actual result and expected result
        expect(result, Right(tMovieModel));
      });

      test('should return remote data when searching for movie top rated ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getListMovieTopRated()).thenAnswer(
          (_) async => tMovieModel,
        );

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getListMovieTopRated();

        //Assert - Compare the actual result and expected result
        expect(result, Right(tMovieModel));
      });

      test('should return remote data when searching for movie details ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getDetailsMovie(movieId: tMovieId))
            .thenAnswer(
          (_) async => tMovieDetailModel,
        );

        //Act - Call the function that is to be tested
        final result =
            await movieRepositoryImpl.getDetailsMovie(movieId: tMovieId);

        //Assert - Compare the actual result and expected result
        expect(result, Right(tMovieDetailModel));
      });

      test('should return remote data when searching for movie cast ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getCast(movieId: tMovieId)).thenAnswer(
          (_) async => tCastModel,
        );

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getCast(movieId: tMovieId);

        //Assert - Compare the actual result and expected result
        expect(result, Right(tCastModel));
      });

      test('should return remote data when searching movie fuond', () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.searchMovie(nameMovie: tNameMovie))
            .thenAnswer(
          (_) async => tMovieModel,
        );

        //Act - Call the function that is to be tested
        final result =
            await movieRepositoryImpl.searchMovie(nameMovie: tNameMovie);

        //Assert - Compare the actual result and expected result
        expect(result, Right(tMovieModel));
      });
    });

    group('error', () {
      test('should return Left<HttpFailure> when searching for movie popular ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getListMoviePopular())
            .thenThrow(const HttpFailure());

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getListMoviePopular();

        //Assert - Compare the actual result and expected result
        expect(result, const Left(HttpFailure()));
      });

      test(
          'should return Left<HttpFailure> when searching for movie top rated ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getListMovieTopRated())
            .thenThrow(const HttpFailure());

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getListMovieTopRated();

        //Assert - Compare the actual result and expected result
        expect(result, const Left(HttpFailure()));
      });

      test('sshould return Left<HttpFailure> when searching for movie details ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getDetailsMovie(movieId: tMovieId))
            .thenThrow(const HttpFailure());

        //Act - Call the function that is to be tested
        final result =
            await movieRepositoryImpl.getDetailsMovie(movieId: tMovieId);

        //Assert - Compare the actual result and expected result
        expect(result, const Left(HttpFailure()));
      });

      test('should return Left<HttpFailure> when searching for movie cast ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.getCast(movieId: tMovieId))
            .thenThrow(const HttpFailure());

        //Act - Call the function that is to be tested
        final result = await movieRepositoryImpl.getCast(movieId: tMovieId);

        //Assert - Compare the actual result and expected result
        expect(result, const Left(HttpFailure()));
      });

      test('should return Left<HttpFailure> when searching movie found ',
          () async {
        //Arrange - Setup facts, Put Expected outputs or Initilize
        when(() => mockMovieDatasource.searchMovie(nameMovie: tNameMovie))
            .thenThrow(const HttpFailure());

        //Act - Call the function that is to be tested
        final result =
            await movieRepositoryImpl.searchMovie(nameMovie: tNameMovie);

        //Assert - Compare the actual result and expected result
        expect(result, const Left(HttpFailure()));
      });
    });
  });

  group('device is offline', () {
    setUp(() {
      when(() => mockNetworkInfo.isConnected()).thenAnswer(
        (_) async => false,
      );
    });

    test(
        'should return Left<NoInternetFailure> when searching for movie popular ',
        () async {
      //Act - Call the function that is to be tested
      final result = await movieRepositoryImpl.getListMoviePopular();

      //Assert - Compare the actual result and expected result
      expect(result, const Left(NoInternetFailure()));
    });

    test(
        'should return Left<NoInternetFailure> when searching for movie top rated ',
        () async {
      //Act - Call the function that is to be tested
      final result = await movieRepositoryImpl.getListMovieTopRated();

      //Assert - Compare the actual result and expected result
      expect(result, const Left(NoInternetFailure()));
    });

    test(
        'should return Left<NoInternetFailure> when searching for movie details ',
        () async {
      //Act - Call the function that is to be tested
      final result =
          await movieRepositoryImpl.getDetailsMovie(movieId: tMovieId);

      //Assert - Compare the actual result and expected result
      expect(result, const Left(NoInternetFailure()));
    });

    test('should return Left<NoInternetFailure> when searching for movie cast ',
        () async {
      //Act - Call the function that is to be tested
      final result = await movieRepositoryImpl.getCast(movieId: tMovieId);

      //Assert - Compare the actual result and expected result
      expect(result, const Left(NoInternetFailure()));
    });
    test('should return Left<NoInternetFailure> when searching for movie cast ',
        () async {
      //Act - Call the function that is to be tested
      final result =
          await movieRepositoryImpl.searchMovie(nameMovie: tNameMovie);

      //Assert - Compare the actual result and expected result
      expect(result, const Left(NoInternetFailure()));
    });
  });
}
