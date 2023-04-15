import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:talants_valley/core/data/network/api/dio_interceptor.dart';

import 'end_points.dart';
import 'package:dio_logger/dio_logger.dart';

class DioClient {

final _dio =Dio()  ..options.baseUrl = Endpoints.baseUrl
  ..options.connectTimeout = 15000
  ..options.receiveTimeout = 30000
  ..options.responseType = ResponseType.json
  ..options.contentType = Headers.formUrlEncodedContentType
  // ..options.validateStatus = (statusCode) => statusCode! <= 500
  ..interceptors.addAll([DioInterceptor() , dioLoggerInterceptor]);



  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {

    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  //--------------------------delete--------------------------------------------
  Future<Response> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final Response response = await _dio.delete(url,
        data: data, queryParameters: queryParameters, cancelToken: cancelToken);
    return response;
  }

  //-------------------------------put------------------------------------------

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
