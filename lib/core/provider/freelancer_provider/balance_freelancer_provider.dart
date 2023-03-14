import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../routing/navigations.dart';
import '../../../utils/helper.dart';
import '../../model/freelancer/bank_account_model.dart';
import '../../model/freelancer/withdrawal_freelancer_model.dart';

class BalanceFreelancerProvider extends ChangeNotifier{
   bool isVisibleHomeError = false;
   String branchSelected = "";
   String ledgerSelected = "";
   BankAccountModel? bankAccountSelected ;
  List<BankAccountModel> bankAccounts = [];
  final List<String> branchesBank =["0446 - Naser" , "0454 - Rimal" , "0448 - Nussairat" , "0451 - Main Branch" , "0452 - Khan Younis" , "0453 - Jabalia" ,"0454 - Rafah" ];
  final List<String> ledgersBank = ["3000 - Current" , "3100 - Saving" , "3102 - Saving For Every Citizen"];
  List<WithdrawalModel> withdrawals = [
    WithdrawalModel(status: "Pending", createdAt: "21 Aug, 12:30 AM", balance: "500", fees: "free", freelancerName: "داليا محمد شحادة", withdrawalFrom: "غزة - مكتب الدانا"),
    WithdrawalModel(status: "Pending", createdAt: "21 Aug, 12:30 AM", balance: "500", fees: "free", freelancerName: "داليا محمد شحادة", withdrawalFrom: "غزة - مكتب الدانا"),
  ];
  bool isVisibleLedgerError = false;
  bool isVisibleBranchError = false;
   final contextKey = ServiceNavigation.serviceNavi.navKey.currentContext!;


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
    if(bankAccountSelected == null){
      isVisibleHomeError = true;
      notifyListeners();
    } else{
      ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.withdrawalPreviewPage);   }
  }

  disposeTimer(){
    seconds = 0;
    minutes = 0;
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

  confirmAddBankAccount({ required BankAccountModel bankAccount}){
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
      bankAccounts.add(bankAccount);
      isVisibleHomeError = false;
      notifyListeners();
      ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.verificationAddBnkPage);
    }
  }

  verificationAddBnkPage(){
    Helpers.balanceShowSnackBar(message: "Bank account has been added.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
  }

  deleteBankAccount({required String accountNumber}){
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          content: "Are you sure you want to delete your bank account?",
          onPressed: (){
            bankAccounts.removeWhere((item) => item.accountNumber == accountNumber);
            notifyListeners();
            Helpers.balanceShowSnackBar(message: "Bank account has been deleted.");
            ServiceNavigation.serviceNavi.popFunction();
          },
        ));
  }

  selectBankAccount({required String accountNumber}){
    for (var element in bankAccounts) {
      element.isSelected = false;
    }
    final int index = bankAccounts.indexWhere((element) => element.accountNumber == accountNumber );
    bankAccounts[index].isSelected = true;
    bankAccountSelected = bankAccounts[index];
    notifyListeners();
  }
  
  approvedWithdrawal(){
    Helpers.balanceShowSnackBar(message: "Wait for the payment to be ready within \n 24 hours.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);
  }

  showStatusWithdrawal({ required BankAccountModel bankAccount}){

  }
  }
