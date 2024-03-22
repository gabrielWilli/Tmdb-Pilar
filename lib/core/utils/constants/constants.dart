const String baseUrl = "https://api.themoviedb.org/3";

const String urlTopRated = '$baseUrl/movie/top_rated';
const String urlPopular = '$baseUrl/movie/popular';

const String sourceSansPro = 'Source Sans Pro';

const String token = String.fromEnvironment('TOKEN_TMDB', defaultValue: '');
