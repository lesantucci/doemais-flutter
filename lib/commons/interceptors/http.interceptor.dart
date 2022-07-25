import 'dart:convert';

import 'package:doemais/commons/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

class ApiInterceptor implements InterceptorContract {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers["Content-Type"] = "application/json";
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
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    final parsed = jsonDecode(data.body.toString());
    final navigatorKey = GlobalKey<NavigatorState>();

    print(data.statusCode);

    return data;
  }
}
