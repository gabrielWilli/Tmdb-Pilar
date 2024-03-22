import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tmdb_pilar/core/error/error.dart';

abstract class RestClientAbs {
  Future<dynamic> get({
    required dynamic url,
    required String token,
  });

  Future<dynamic> post({
    required dynamic url,
    required dynamic data,
    Map<String, String>? optionalHeaders,
  });
}

@Injectable(as: RestClientAbs)
class HttpService implements RestClientAbs {
  final http.Client _httpClient;

  HttpService(@Named('http') this._httpClient);

  final Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  @override
  Future get({
    required url,
    String? token,
  }) async {
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = "Bearer $token";
    }

    try {
      final Uri uri = (url is String) ? Uri.parse(url) : (url as Uri);

      final response = await _httpClient
          .get(uri, headers: headers)
          .timeout(const Duration(minutes: 2));

      if (response.statusCode == 200) return jsonDecode(response.body);

      throw HttpException(
        statusCode: response.statusCode,
        responseMessage: response.reasonPhrase!,
        exception: Exception(
          '${response.reasonPhrase}\n${response.body}',
        ),
      );
    } on http.ClientException catch (e) {
      throw HttpException(
        responseMessage: e.message,
        exception: Exception(e.message),
      );
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  @override
  Future post({
    required url,
    required data,
    Map<String, String>? optionalHeaders,
    String? token,
  }) {
    throw UnimplementedError();
  }
}
