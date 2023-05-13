import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/repository/freelancer_repo/payout_freelancer_repo.dart';
import 'package:talants_valley/core/model/freelancer/payout/withdrawal_model.dart';
import 'package:talants_valley/locator.dart';

class HomeTeamDashboardProvider extends ChangeNotifier{
  final PayoutFreelancerRepo  _repo =  locator<PayoutFreelancerRepo>();

  bool isLoading = false;
  List<WithdrawModel> withdrawals = [];

  Future<dynamic> getWithdrawals() async {
    isLoading = true;
    final dataResponse = await _repo.getWithdrawalsRepo(limit: 5);
    withdrawals = dataResponse;
    debugPrint(" This is the length =>>> ${withdrawals.length.toString()}");
    notifyListeners();
  }

  disposeIsLoading() {
    isLoading = false;
    notifyListeners();
  }

}