import 'package:dio/dio.dart';
import 'package:talants_valley/core/data/network/dioInterceptor.dart';

import 'api/endPoints.dart';
class DioClient {
// dio instance
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 30000
      ..options.responseType = ResponseType.json
      ..options.contentType = Headers.formUrlEncodedContentType
      // ..interceptors.addAll(iterable)
      ..interceptors.add(DioInterceptor());
  }

  // static DioClient dioClient = DioClient(_dio);

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {

      final Response response = await dio.get(
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
    try {
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
