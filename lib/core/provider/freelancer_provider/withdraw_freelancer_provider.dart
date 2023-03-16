import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/local/sharedController.dart';
import 'package:talants_valley/core/data/repository/freelancer/withdraw_freelancer_repo.dart';
import 'package:talants_valley/core/model/recipient_model.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../routing/navigations.dart';
import '../../../utils/helper.dart';
import '../../model/freelancer/withdrawal_model.dart';

class WithdrawFreelancerProvider extends ChangeNotifier{
  SharedPrefController sharedPref = SharedPrefController();
   bool isVisibleHomeError = false;
   bool isVisablAmountCashError = false;
   String? mountUserToWithdrawal;
   String branchSelected = "";
   String ledgerSelected = "";
   BankModel? bankAccountSelected ;
   OfficeModel? officeSelected;
   RecipientModel?  recipientSelected;
  List<BankModel> bankAccounts = [];
  final List<String> branchesBank =["0446 - Naser" , "0454 - Rimal" , "0448 - Nussairat" , "0451 - Main Branch" , "0452 - Khan Younis" , "0453 - Jabalia" ,"0454 - Rafah" ];
  final List<String> ledgersBank = ["3000 - Current" , "3100 - Saving" , "3102 - Saving For Every Citizen"];
  List<WithdrawModel> withdrawals = [];
  List<OfficeModel> officeList = [];
  List<RecipientModel> recipients = [];
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

  selectOffice({required String officeId}) {
    for (var element in bankAccounts) {
      element.isSelected = false;
    }
    final int index = officeList.indexWhere((element) => element.id == officeId );
    officeList[index].isSelected = true;
    officeSelected = officeList[index];
    notifyListeners();
    ServiceNavigation.serviceNavi.popFunction();
  }

//----------------------------------sendCodeAddBankAccount----------------------
  Future<dynamic> sendCodeAddBankAccount({ required String accountName, required String accountNumber, required String bankBranch, required String ledger}) async {
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
      final dataResponse = await WithdrawFreelancerRep().sendCodeAddBankRepo(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger!);
      sharedPref.savaBankAccountToVerify(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger, bankName: "Palestine");
      isVisibleHomeError = false;
      notifyListeners();
      ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.verificationAddBnkPage);
    }
  }

//-----------------------------verifyAddBnkPage---------------------------------

  Future<dynamic> verifyAddBnkPage({ required String code}) async{
    final dataResponse = await WithdrawFreelancerRep().verifyAddAccountRepo(accountName: sharedPref.getBankAccountName(), accountNumber: sharedPref.getBankAccountNumber(), bankBranch: sharedPref.getBankAccountBranch(), ledger: sharedPref.getBankAccountLeger(), code: code, bankName: "Palestine");
    disposeTimer();
    Helpers.balanceShowSnackBar(message: "Bank account has been added.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
  }

//----------------------------getBankAccountList--------------------------------

Future<dynamic> getBankAccountList() async {
    final response = await WithdrawFreelancerRep().getBankAccountListRepo();
    bankAccounts = response;
    notifyListeners();
}

//---------------------------deleteBankAccount---------------------------------

  Future<dynamic> deleteBankAccount({required String bankId}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          content: "Are you sure you want to delete your bank account?",
          onPressed: () async {
            final dataResponse = await WithdrawFreelancerRep().deleteBankAccountRepo(idBank: bankId);
            bankAccounts.removeWhere((item) => item.id == bankId);
            notifyListeners();
            Helpers.balanceShowSnackBar(message: "Bank account has been deleted.");
            ServiceNavigation.serviceNavi.popFunction();
          },
        ));
  }

//------------------------------------------------------------------------------

Future<dynamic> getWithdrawList() async {
    final dataResponse = await WithdrawFreelancerRep().getWithdrawalRequestList();
    withdrawals = dataResponse;
    notifyListeners();

}

//-----------------------------getOfficeList------------------------------------

  Future<dynamic> getOfficeList() async{
    final dataResponse = await WithdrawFreelancerRep().getOfficeListRepo();
    officeList  = dataResponse;
    officeSelected = officeList.first;
    notifyListeners();
  }
//------------------------------------------------------------------------------

  Future<dynamic> sendCodeRecipient({required String mobile, required String idNumber, required String name}) async {
    final dataResponse = await WithdrawFreelancerRep().senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
    SharedPrefController().saveRecipientData(mobile: mobile, idNumber: idNumber, name: name);
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.verificationAddRecipientPage);
  }

//------------------------------------------------------------------------------

 Future<dynamic> verificationAddRecipient({required String code}) async{
    final dataResponse = await WithdrawFreelancerRep().verificationAddRecipient(code: code, mobile: SharedPrefController().getMobileRecipient(), idNumber: SharedPrefController().getIdNumberRecipient(), name: SharedPrefController().getNameRecipient());
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
 }

//------------------------------------------------------------------------------
  Future<dynamic> getRecipients() async {
    final dataResponse = await WithdrawFreelancerRep().getRecipientsRepo();
    recipients = dataResponse;
    recipients.first.isSelected = true;
    recipientSelected = recipients.first;
    notifyListeners();
  }

 //-----------------------------------------------------------------------------

  Future<dynamic> deleteRecipient({required String? id}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          content: "Are you sure you want to delete this recipient?",
          onPressed: () async {
            final dataResponse = await WithdrawFreelancerRep().deleteRecipientRepo(id: id!);
            recipients.removeWhere((item) => item.id == id);
            notifyListeners();
            ServiceNavigation.serviceNavi.popFunction();
            Helpers.balanceShowSnackBar(message: "Recipient has been deleted.");
          },
        ));
  }

//------------------------------------------------------------------------------

Future<dynamic> saveUpdateRecipient({required String mobile, required String idNumber, required String name }) async{
  final dataResponse = await WithdrawFreelancerRep().senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
  SharedPrefController().saveRecipientData(mobile: mobile, idNumber: idNumber, name: name);
  notifyListeners();
  ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.verificationEditRecipient);
}

Future<dynamic> updateRecipient({required String code, required String id, required String mobile , required String idNumber, required String name}) async{
    final dataResponse = WithdrawFreelancerRep().updateRecipientRepo(id: id, code: code, mobile: mobile, idNumber: idNumber, name: name);
    Helpers.balanceShowSnackBar(message: "Recipient has been Edited.");
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
}

  addAmountToWithdraw({required String amount}) {
    sharedPref.saveAmountToWithdraw(amountToWithdraw: amount);
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
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

  selectRecipient({required String idNumber}){
    for (var element in recipients) {
      element.isSelected = false;
    }
    final int index = recipients.indexWhere((element) => element.idNumber == idNumber);
    recipients[index].isSelected = true;
    recipientSelected = recipients[index];
    notifyListeners();
  }
  
  Future<dynamic> requestBankWithdraw({required String bankId, required int amount}) async {
    final dataResponse = await WithdrawFreelancerRep().requestBankWithdrawRepo(bankId: bankId, amount: amount);
    Helpers.balanceShowSnackBar(message: "Wait for the payment to be ready within \n 24 hours.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);
  }

  takeAmountCash(TextEditingController controller){
    controller.text = SharedPrefController().getUser().balance.toString();
    notifyListeners();
  }

  showStatusWithdrawal({ required BankModel bankAccount}){
  }
  }
