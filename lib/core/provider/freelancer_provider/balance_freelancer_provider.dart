import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../routing/navigations.dart';
import '../../model/freelancer/bank_account_model.dart';

class BalanceFreelancerProvider extends ChangeNotifier{
   bool isVisible = false;
   String branchSelected = "";
   String ledgerSelected = "";
  List<BankAccountModel> bankAccounts = [];
  final List<String> branchesBank =["0446 - Naser" , "0454 - Rimal" , "0448 - Nussairat" , "0451 - Main Branch" , "0452 - Khan Younis" , "0453 - Jabalia" ,"0454 - Rafah" ];
  final List<String> ledgersBank = ["3000 - Current" , "3100 - Saving" , "3102 - Saving For Every Citizen"];
  bool isVisibleLedgerError = false;
  bool isVisibleBranchError = false;

   int seconds = 59;
   int minutes = 1;
   Timer? timer;
   int counterMinutes = 0;
   bool timerCansel = false;

   twoDigits(int n) => n.toString().padLeft(2, "0");
// final minute = twoDigits(const Duration().inMinutes.remainder(60));
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if(seconds != 0 ) {
        seconds--;
        notifyListeners();
      }else if(seconds == 0 && minutes != 0){
        if (minutes != 0 ){
          minutes--;
          seconds += 60;
        }
      }
      else {
        timer?.cancel();
        notifyListeners();
      }
    });
  }

  resendCode(){
    seconds = 60;
    minutes = 1;
    startTimer();
    notifyListeners();
  }
  continueWithdraw(){
    if(bankAccounts.isEmpty){
      isVisible = true;
      notifyListeners();
    }
  }

  disposeTimer(){
    timer?.cancel();
    notifyListeners();
  }

  selectBranch({required String branch}){
    branchSelected = branch;
    ServiceNavigation.serviceNavi.popFunction();
    notifyListeners();
  }

  selectLedger({required String ledger}){
    ledgerSelected = ledger;
    ServiceNavigation.serviceNavi.popFunction();
    notifyListeners();
  }

  confirmAddBankAccount(){
    if(branchSelected.isEmpty && ledgerSelected.isEmpty){
      isVisibleLedgerError = true;
      isVisibleBranchError = true;
      notifyListeners();
    }
    else if(branchSelected.isEmpty) {
      isVisibleBranchError = true;
      notifyListeners();
    }else if(ledgerSelected.isEmpty){
      isVisibleLedgerError = true;
      notifyListeners();
    } else {
      ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.verificationAddBnkPage);
    }
  }
}