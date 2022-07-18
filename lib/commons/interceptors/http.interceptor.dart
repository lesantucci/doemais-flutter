import 'package:doemais/commons/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class WeatherApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      if (Storage.jwt != "") {
        data.headers['access_token'] = Storage.jwt;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
