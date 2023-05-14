import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/auth_repo.dart';
import 'package:talants_valley/core/provider/auth_and_verification_provider/auth_provider.dart';
import 'package:talants_valley/locator.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activity_provider/activity_provider.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/home_team_dashboard_provider/home_team_dashboard_provider.dart';
import 'package:talants_valley/ui/teamPages/notification_team/notification_team_core/notification_team_provider/notification_team_provider.dart';

import '../../../../utils/helper.dart';
import '../../../provider/freelancer_provider/payout_freelancer_provider.dart';
import '../../local/shared_controller.dart';

class DioInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = "Bearer ${SharedPrefController().accessToken}";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    Provider.of<AuthProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();
    Provider.of<PayoutFreelancerProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();
    Provider.of<ActivityProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeLoading();
    Provider.of<NotificationTeamProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeLoading();
    Provider.of<HomeTeamDashboardProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Provider.of<AuthProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();
    Provider.of<PayoutFreelancerProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();
    Provider.of<ActivityProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeLoading();
    Provider.of<NotificationTeamProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeLoading();
    Provider.of<HomeTeamDashboardProvider>(Helpers.scaffoldKey.currentState!.context, listen: false).disposeIsLoading();


    switch(err.type){
      case DioErrorType.connectTimeout:
        {
          Helpers.showSnackBar(message: "Check your internet connection");
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
        debugPrint("This is response ====>>> \n\n\n${err.response!.statusCode.toString()}");
          if(err.response!.statusCode == 400){
            Helpers.showSnackBar(message: err.response!.data["message"]);
            debugPrint("after Pro this is 400");
          }
          else if(err.response!.statusCode == 404){
            Helpers.showSnackBar(message: err.response!.data["message"]);
          }
          else if(err.response!.statusCode == 401){
            Helpers.showSnackBar(message: err.response!.data["message"]);
            locator<AuthRepo>().refreshTokenRepo(token: SharedPrefController().accessToken);
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
