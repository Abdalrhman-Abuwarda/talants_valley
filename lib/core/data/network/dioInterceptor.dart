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

        debugPrint("This is the statusCode ${err.response!.statusCode}");
        debugPrint("${err.response!.statusCode == 400}");
          debugPrint('This is response error  $err');
          debugPrint('This is response error message ${err.message}');
          debugPrint('This is data ${err.response!.data}');
          debugPrint('This is dataResponse ${err.response}');
          debugPrint('This is message ${err.message}');
          debugPrint('This is dataError ${err.error}');


          if(err.response!.statusCode == 400){
            Helpers.showSnackBar(message: err.response!.data["message"]);
            debugPrint("after Pro this is 400");
          }
          else if(err.response!.statusCode == 404){
            Helpers.showSnackBar(message: err.response!.data["message"]);
            // Helpers.showSnackBar(message: "not verified address");
          }
          else if(err.response!.statusCode == 401){
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          else if(err.response!.statusCode == 422) {
            debugPrint("This is error message \n ${err.response!.data["message"].toString()}");
            Helpers.showSnackBar(message: err.response?.data["message"] ?? "Error");
          }
          debugPrint(err.response!.statusCode.toString());
          debugPrint(err.response!.data.toString());

        break;
      case DioErrorType.other:
          debugPrint('This is other Type error $err');
          debugPrint(err.response!.statusCode.toString());
        break;
    }
    super.onError(err, handler);
  }
}
