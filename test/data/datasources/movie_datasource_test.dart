import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_pilar/core/http/http_service.dart';
import 'package:tmdb_pilar/data/datasources/movie_datasource.dart';
import 'package:tmdb_pilar/data/models/cast_model.dart';
import 'package:tmdb_pilar/data/models/movie_details_model.dart';
import 'package:tmdb_pilar/data/models/movie_model.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/cast_mock.dart';
import '../../mocks/movie_details_mock.dart';
import '../../mocks/movie_mock.dart';

class MockRestClient extends Mock implements RestClientAbs {}

void main() {
  late MockRestClient mockRestClientAbs;
  late MovieDatasource movieDatasource;

  setUp(() {
    mockRestClientAbs = MockRestClient();
    movieDatasource = MovieDatasource(restClientAbs: mockRestClientAbs);
  });

  final List<MovieModel> tMovieModel = [MovieMock.movieModel];
  final List<CastModel> tCastModel = [CastMock.castModel];
  final MovieDetaislModel tMovieDetailModel =
      MovieDetailsMock.movieDetaislModel;
  const int tMovieId = 5;
  const String tNameMovie = 'Kung';

  test('should return a list of movie popular', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(
      () => mockRestClientAbs.get(
        url: any(named: 'url'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async => jsonDecode(fixture('movie.json')));

    //Act - Call the function that is to be tested
    final result = await movieDatasource.getListMoviePopular();

    //Assert - Compare the actual result and expected result
    expect(result, tMovieModel);
  });
  test('should return a list of movie top rated', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(
      () => mockRestClientAbs.get(
        url: any(named: 'url'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async => jsonDecode(fixture('movie.json')));

    //Act - Call the function that is to be tested
    final result = await movieDatasource.getListMovieTopRated();

    //Assert - Compare the actual result and expected result
    expect(result, tMovieModel);
  });

  test('should return a movie detail', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(
      () => mockRestClientAbs.get(
        url: any(named: 'url'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async => jsonDecode(fixture('details_movie.json')));

    //Act - Call the function that is to be tested
    final result = await movieDatasource.getDetailsMovie(movieId: tMovieId);

    //Assert - Compare the actual result and expected result
    expect(result, tMovieDetailModel);
  });

  test('should return a list of cast', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(
      () => mockRestClientAbs.get(
        url: any(named: 'url'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async => jsonDecode(fixture('cast.json')));

    //Act - Call the function that is to be tested
    final result = await movieDatasource.getCast(movieId: tMovieId);

    //Assert - Compare the actual result and expected result
    expect(result, tCastModel);
  });

  test('should return a list when search', () async {
    //Arrange - Setup facts, Put Expected outputs or Initilize
    when(
      () => mockRestClientAbs.get(
        url: any(named: 'url'),
        token: any(named: 'token'),
      ),
    ).thenAnswer((_) async => jsonDecode(fixture('movie.json')));

    //Act - Call the function that is to be tested
    final result = await movieDatasource.searchMovie(nameMovie: tNameMovie);

    //Assert - Compare the actual result and expected result
    expect(result, tMovieModel);
  });
}
