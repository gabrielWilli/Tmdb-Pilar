import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @singleton
  @Named('http')
  http.Client get httpClient => http.Client();
}