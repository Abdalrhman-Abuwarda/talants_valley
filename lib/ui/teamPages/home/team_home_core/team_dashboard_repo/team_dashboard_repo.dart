import 'package:flutter/cupertino.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/model/freelancer/payout/withdrawal_model.dart';
import 'package:talants_valley/locator.dart';

class TeamDashboardRepo {
  final DioClient _dioClient = locator<DioClient>();

  Future<List<WithdrawModel>> getPayoutsDashboardRepo() async {
    final response =
        await _dioClient.get(Endpoints.getPayoutsDashboard, queryParameters: {
      "offset": 0,
      "limit": 5,
    });

    final List dataList = response.data["data"]["payouts"];
    debugPrint("This payouts inside repo \n\n\n  $dataList \n\n");
    final List<WithdrawModel> withdrawals =
        dataList.map((element) => WithdrawModel.formJson(element)).toList();
    return withdrawals;
  }
}
