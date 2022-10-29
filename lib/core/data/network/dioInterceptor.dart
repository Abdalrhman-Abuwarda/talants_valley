import 'package:dio/dio.dart';

import '../../../utils/helper.dart';
import '../local/sharedController.dart';

class DioInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(options.headers.containsKey("Authorization")){
    options.headers['Authorization'] = "Bearer ${SharedPrefController().getData().accessToken}";}
    // super.onRequest(options, handler);
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
          print('This is connectTimeout [The exception for a failed connection attempt.] $err');
          print(err.response!.statusCode);
          throw Exception("Not Internet Connection");
        }
        break;
      case DioErrorType.receiveTimeout:
        {
          print("This is receiveTimeout error [The exception for failing to receive a response.] $err");
          print(err.response!.statusCode);
        }
        break;
      case DioErrorType.sendTimeout:
        {
          print("This is sendTimeout error [The exception for failing to send a request.] $err");
          print(err.response!.statusCode);
        }
        break;
      case DioErrorType.cancel:
        {
          print('This is cancel error [The exception for a prematurely cancelled request.] $err');
          print(err.response!.statusCode);
        }
        break;
      case DioErrorType.response:

          print('This is response err $err');
          print(err.response!.data);
          if(err.response!.statusCode == 400){
            print("Helllllo Pro this is 400");
            Helpers.showSnackBar(message: err.response!.data["message"]);
            print("after Pro this is 400");

          }
          else if(err.response!.statusCode == 401){
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          else if(err.response!.statusCode == 422) {
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          print(err.response!.statusCode);

        break;
      case DioErrorType.other:
        {
          print('This is other Type error $err');
          print(err.response!.statusCode);
        }
        break;
    }
    // super.onError(err, handler);
  }
}

