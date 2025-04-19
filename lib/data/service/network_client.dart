import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? data;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.data,
    this.errorMessage = 'something went wrong!',
  });
}

class NetworkClient {
  //instantiate the logger class
  static final Logger _logger = Logger();

  static Future<NetworkResponse> getRequest({required String url}) async {
    Uri uri = Uri.parse(url);
    _preRequestLog(url);
    Response response = await get(uri);

    //custom logger message
    _postRequestLog(url, response.statusCode,
        headers: response.headers, responseBody: response.body);

    //check the response status
    try {
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true, statusCode: response.statusCode, data: decodeData);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      _postRequestLog(
        url,
        -1,
        errorMessage: e.toString(),
      );
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    Uri uri = Uri.parse(url);

    //logger to see the data we are sending
    _preRequestLog(url, body: body);

    Response response = await post(
      uri,
      headers: {'Content-type': 'Application/json'},
      body: jsonEncode(body),
    );

    //logger
    _postRequestLog(url, response.statusCode,
        responseBody: response.body, headers: response.headers);

    //check the response status
    try {
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true, statusCode: response.statusCode, data: decodeData);
      } else {
        final decodeJson  = jsonDecode(response.body);
        String errorMessage = decodeJson['data'] ?? 'Something went wrong!';
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode, errorMessage: errorMessage);
      }
    } catch (e) {
      _postRequestLog(url, -1, errorMessage: e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  static void _preRequestLog(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'URL => $url\n'
      'body: $body',
    );
  }

  static void _postRequestLog(
    String url,
    int statusCode, {
    Map<String, dynamic>? headers,
    dynamic responseBody,
    dynamic errorMessage,
  }) {
    if (errorMessage != null) {
      _logger.e(
        'URL : $url\n'
        'Status code : $statusCode\n'
        'Error Message : $errorMessage',
      );
    } else {
      _logger.i(
        'URL : $url\n'
        'Status code : $statusCode\n'
        'Headers : $headers\n'
        'Response : $responseBody',
      );
    }
  }
}
