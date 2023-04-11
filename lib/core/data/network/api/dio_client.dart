import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:talants_valley/core/data/network/api/dio_interceptor.dart';

import '../../../../locator.dart';
import 'end_points.dart';
import 'package:dio_logger/dio_logger.dart';

class DioClient {
// dio instance
//   final Dio dio;di
  // DioInterceptor get interceptor =>  locator<DioInterceptor>();
final _dio =Dio()  ..options.baseUrl = Endpoints.baseUrl
  ..options.connectTimeout = 15000
  ..options.receiveTimeout = 30000
  ..options.responseType = ResponseType.json
  ..options.contentType = Headers.formUrlEncodedContentType
  ..interceptors.addAll([DioInterceptor() , dioLoggerInterceptor]);
// ..options.validateStatus
//   ..interceptors.add(dioLoggerInterceptor);
  // DioClient(this.dio) {
  //   dio
  //     ..options.baseUrl = Endpoints.baseUrl
  //     ..options.connectTimeout = 15000
  //     ..options.receiveTimeout = 30000
  //     ..options.responseType = ResponseType.json
  //     ..options.contentType = Headers.formUrlEncodedContentType
  //     ..interceptors.add(DioInterceptor())
  //     // ..options.validateStatus
  //     ..interceptors.add(dioLoggerInterceptor);
  //
  // }


  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    debugPrint("This is inside Dio Clint in get function ===>>>> ");
    debugPrint("This is inside Dio Clint in get function ===>>>> ${_dio.interceptors.length}");
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
