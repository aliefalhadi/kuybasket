import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:kuybasket/data/dio/dio.dart';

class BaseAPI {
  String _uri = '';
  Dio _dio = ApiInterceptors().dio;

  String baseUrl = 'http://192.168.1.15/kuybasket_backend/api/v1';

  Future getWithCache(String url,
      {Duration duration,
        String key,
        String subKey,
        bool isRefresh = false}) async {
    // url = baseUrl + url;
    // print(url);
    final response = _dio.get(url,
        options: buildCacheOptions(duration,
            primaryKey: key,
            subKey: subKey,
            maxStale: Duration(minutes: 2),
            forceRefresh: isRefresh,
            options: Options(headers: {'requiresToken': true})));
    return response;
  }

  Future get(String url) async {
    // url = baseUrl + url;
    // print(url);

    final response = await _dio.get(url);
    return response;
  }

  Future post({String url, String data}) async {
    url = baseUrl + url;
    print(url);

    final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        })
    );
    return response;
  }
}