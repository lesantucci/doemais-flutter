import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import '../interceptors/http.interceptor.dart';

class HttpHandler {
  static final http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  static Future<http.Response> post(String url, Map<String, dynamic> body) {
    return client.post(Uri.parse(url), body: jsonEncode(body));
  }

  static Future<http.Response> get(String url) {
    return client.get(Uri.parse(url));
  }

  static Future<http.Response> put(String url, [dynamic body]) {
    return client.put(Uri.parse(url), body: body);
  }
}
