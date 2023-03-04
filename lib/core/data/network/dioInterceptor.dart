import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper.dart';
import '../local/sharedController.dart';

class DioInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // if(options.headers.containsKey("Authorization")){
    options.headers['Authorization'] = "Bearer ${SharedPrefController().accessToken}";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

    switch(err.type){
      case DioErrorType.connectTimeout:
        {
          debugPrint('This is connectTimeout [The exception for a failed connection attempt.] $err');
          debugPrint(err.response!.statusCode.toString());
          throw Exception("Not Internet Connection");
        }
      case DioErrorType.receiveTimeout:
        {
          debugPrint("This is receiveTimeout error [The exception for failing to receive a response.] $err");
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioErrorType.sendTimeout:
        {
          debugPrint("This is sendTimeout error [The exception for failing to send a request.] $err");
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioErrorType.cancel:
        {
          debugPrint('This is cancel error [The exception for a prematurely cancelled request.] $err');
          debugPrint(err.response!.statusCode.toString());
        }
        break;
      case DioErrorType.response:

          debugPrint('This is response err $err');
          debugPrint(err.response!.data);
          if(err.response!.statusCode == 400){
            Helpers.showSnackBar(message: err.response!.data["message"]);
            debugPrint("after Pro this is 400");
          }
          else if(err.response!.statusCode == 404){
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          else if(err.response!.statusCode == 401){
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          else if(err.response!.statusCode == 422) {
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          debugPrint(err.response!.statusCode.toString());

        break;
      case DioErrorType.other:
          debugPrint('This is other Type error $err');
          debugPrint(err.response!.statusCode.toString());
        break;
    }
    super.onError(err, handler);
  }
}

