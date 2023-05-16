import 'package:flutter/material.dart';
import 'package:talants_valley/core/model/freelancer/payout/withdrawal_model.dart';
import 'package:talants_valley/locator.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/team_dashboard_repo/team_dashboard_repo.dart';

class HomeTeamDashboardProvider extends ChangeNotifier{
  final TeamDashboardRepo  _repo =  locator<TeamDashboardRepo>();

  bool isLoading = false;
  List<WithdrawModel> withdrawals = [];

  Future<dynamic> getWithdrawals() async {
    isLoading = true;
    final dataResponse = await _repo.getPayoutsDashboardRepo();
    withdrawals = dataResponse;
    debugPrint(" This is the length =>>> ${withdrawals.length.toString()}");
    notifyListeners();
  }

  disposeIsLoading() {
    isLoading = false;
    notifyListeners();
  }

}