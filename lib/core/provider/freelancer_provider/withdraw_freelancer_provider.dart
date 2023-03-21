import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
   RecipientModel?  recipientForEdit;
  List<BankModel> bankAccounts = [];
  final List<String> branchesBank =["0446 - Naser" , "0454 - Rimal" , "0448 - Nussairat" , "0451 - Main Branch" , "0452 - Khan Younis" , "0453 - Jabalia" ,"0454 - Rafah" ];
  final List<String> ledgersBank = ["3000 - Current" , "3100 - Saving" , "3102 - Saving For Every Citizen"];
  List<WithdrawModel> withdrawals = [];
  List<OfficeModel> officeList = [];
  List<RecipientModel> recipients = [];
  bool isVisibleLedgerError = false;
  bool isVisibleBranchError = false;
   final contextKey = ServiceNavigation.serviceNavi.navKey.currentContext!;
   bool isLoadingResponse = false;
   WithdrawModel? withdrawForPreview;
   bool withdrawalsIsUpdated = false;
   String? idWithdrawForPreview;
   bool isLoading = false;


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
    sendCodeAddBankAccount({ required String accountName, required String accountNumber, required String bankBranch, required String ledger}) async {
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
      isLoading = true;
      notifyListeners();
      final dataResponse = await WithdrawFreelancerRepo().sendCodeAddBankRepo(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger!);
      SharedPrefController().savaBankAccountToVerify(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger, bankName: "Palestine");
      isVisibleHomeError = false;
      notifyListeners();
      ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.verificationAddBnkPage);
    }
  }

//-----------------------------verifyAddBnkPage---------------------------------

    verifyAddBnkPage({ required String code}) async{
    isLoading = true;
    final dataResponse = await WithdrawFreelancerRepo().verifyAddAccountRepo(accountName: SharedPrefController().getBankAccountName(), accountNumber: SharedPrefController().getBankAccountNumber(), bankBranch: SharedPrefController().getBankAccountBranch(), ledger: SharedPrefController().getBankAccountLeger(), code: code, bankName: "Palestine");
    disposeTimer();
    Helpers.balanceShowSnackBar(message: "Bank account has been added.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
  }

//----------------------------getBankAccountList--------------------------------

  getBankAccountList() async {
    isLoading = true;
    // notifyListeners();
    final response = await WithdrawFreelancerRepo().getBankAccountListRepo();
    bankAccounts = response;
    notifyListeners();
}

//---------------------------deleteBankAccount---------------------------------

    deleteBankAccount({required String bankId}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          isLoading: isLoading,
          content: "Are you sure you want to delete your bank account?",
          onPressed: () async {
            isLoading = true;
            notifyListeners();
            final dataResponse = await WithdrawFreelancerRepo().deleteBankAccountRepo(idBank: bankId);
            if(dataResponse.statusCode == 200){
              isLoading = false;
              bankAccounts.removeWhere((item) => item.id == bankId);
              notifyListeners();
              Helpers.balanceShowSnackBar(message: "Bank account has been deleted.");
              ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.balanceFreelancerPage);
            }
          },
        ));

  }

//------------------------------------------------------------------------------

  getWithdrawList() async {
    isLoading = true;
    final dataResponse = await WithdrawFreelancerRepo().getWithdrawalRequestList();
    withdrawals = dataResponse;
    debugPrint(" This is the length =>>> ${withdrawals.length.toString()}");
    notifyListeners();
}

//------------------------------------------------------------------------------

  checkWithdrawList() async {
    if(withdrawals.isEmpty || withdrawalsIsUpdated == true){
      getWithdrawList();
    }
}

//-----------------------------getOfficeList------------------------------------

    getOfficeList() async{
    isLoading = true;
    final dataResponse = await WithdrawFreelancerRepo().getOfficeListRepo();
    officeList  = dataResponse;
    officeSelected = officeList.first;
    notifyListeners();
  }
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------

   sendCodeRecipient({required String mobile, required String idNumber, required String name}) async {
    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
    sharedPref.saveRecipientData(mobile: mobile, idNumber: idNumber, name: name);
    debugPrint("This is data Recipient in Shared Pref ${sharedPref.getNameRecipient()} , ${sharedPref.getIdNumberRecipient()} , ${sharedPref.getMobileRecipient()}");
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.verificationAddRecipientPage);
  }

//------------------------------------------------------------------------------

   verificationAddRecipient({required String code , required String mobile, required String idNumber, required String name}) async{
    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().verificationAddRecipient(code: code, mobile: mobile, idNumber: idNumber, name: name);
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
 }

//------------------------------------------------------------------------------
    getRecipients() async {
    isLoading = true;
    final dataResponse = await WithdrawFreelancerRepo().getRecipientsRepo();
    recipients = dataResponse;
    notifyListeners();
  }

 //-----------------------------------------------------------------------------

    deleteRecipient({required String? id}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          isLoading: isLoading,
          content: "Are you sure you want to delete this recipient?",
          onPressed: () async {
            isLoading = true;
            notifyListeners();
            final dataResponse = await WithdrawFreelancerRepo().deleteRecipientRepo(id: id!);
            recipients.removeWhere((item) => item.id == id);
            notifyListeners();
            ServiceNavigation.serviceNavi.popFunction();
            Helpers.balanceShowSnackBar(message: "Recipient has been deleted.");
          },
        ));
  }

//------------------------------------------------------------------------------

  saveUpdateRecipient({required String mobile, required String idNumber, required String name }) async{
    isLoading = true;
    notifyListeners();
  final dataResponse = await WithdrawFreelancerRepo().senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
  sharedPref.saveRecipientData(name: name, mobile: mobile, idNumber: idNumber);

  notifyListeners();
  ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.verificationEditRecipient);
}

  updateRecipient({required String code, required String id, required String mobile , required String idNumber, required String name}) async{
    isLoading = true;
    notifyListeners();
    final dataResponse = WithdrawFreelancerRepo().updateRecipientRepo(id: id, code: code, mobile: mobile, idNumber: idNumber, name: name);
    Helpers.balanceShowSnackBar(message: "Recipient has been Edited.");
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
}

  addAmountBankToWithdraw({required String amount}) {
    SharedPrefController().saveAmountToWithdraw(amountToWithdraw: amount);
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
  }

//-------------------------selectBankAccount------------------------------------

  selectBankAccount({required String accountNumber}){
    for (var element in bankAccounts) {
      element.isSelected = false;
    }
    final int index = bankAccounts.indexWhere((element) => element.accountNumber == accountNumber );
    bankAccounts[index].isSelected = true;
    bankAccountSelected = bankAccounts[index];
    notifyListeners();
  }

//-------------------------------selectRecipient--------------------------------
  selectRecipient({required String idNumber}){
    for (var element in recipients) {
      element.isSelected = false;
    }
    final int index = recipients.indexWhere((element) => element.idNumber == idNumber);
    recipients[index].isSelected = true;
    recipientSelected = recipients[index];
    notifyListeners();
    ServiceNavigation.serviceNavi.popFunction();
  }

//----------------------------checkSelectRecipients-----------------------------

  checkSelectRecipients() {
     recipientSelected == null ?
      Helpers.showSnackBar(message: "Please Choose Recipient") :

      ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.chooseOfficePage);

  }

  //-------------------------editRecipient--------------------------------------

  editRecipient({required RecipientModel recipient}) {
    recipientForEdit = recipient;
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.editRecipientPage);
  }

  //--------------------------requestBankWithdraw-------------------------------
    requestBankWithdraw({required String bankId, required int amount}) async {
    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().requestBankWithdrawRepo(bankId: bankId, amount: amount);
    withdrawalsIsUpdated == true;
    notifyListeners();
    Helpers.balanceShowSnackBar(message: "Wait for the payment to be ready within \n 24 hours.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);

  }

  //------------------------requestCashWithdraw---------------------------------
    requestCashWithdraw({required String amount, required String officeId, required String recipientId}) async{

    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().requestWithdrawCashRepo(amount: int.parse(amount), officeId: officeId, recipientId: recipientId);

    withdrawalsIsUpdated == true;
    startTimer();
    notifyListeners();
    Helpers.balanceShowSnackBar(message: "Wait for the payment to be ready within \n 24 hours.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);
  }

 //---------------------------------------------------------------------------

  selectWithdrawId(id){
    idWithdrawForPreview = id;
    notifyListeners();
  }
  //-----------------------------------------------------------------------------
   getWithdrawDetails({required withdrawId}) async {
    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().getWithdrawDetailsRepo(id: withdrawId!);
    debugPrint("This is details inside provider =>>> $dataResponse");
    withdrawForPreview = dataResponse;
    withdrawForPreview!.office == null ?
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.previewBankWithdrawalStatus)
        :
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.previewCashWithdrawalStatus);
    DateTime dateTime = DateTime.parse(withdrawForPreview!.history!.first.createdAt);
    var formatterDate =  DateFormat('dd/MM');
    var formatterTime =  DateFormat('dd/MM');
    var formatted = formatterDate.format(dateTime);
    var formattedTime = DateFormat.jm().format(dateTime);
    debugPrint("This is dateTim =>>> $formatted");
    debugPrint("This is formattedTime =>>> $formattedTime");
    notifyListeners();

 }

 //----------------------------cancelWithdraw-----------------------------------

    cancelWithdraw({required String withdrawId}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          isLoading: isLoading,
          content: "Are you sure you want to delete your Withdraw?",
          onPressed: () async {
            isLoading = true;
            notifyListeners();
            final dataResponse = await WithdrawFreelancerRepo().cancelWithdrawRepo(id: withdrawId);
            ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.balanceFreelancerPage);
            Helpers.balanceShowSnackBar(message: "Withdraw has been deleted.");},
        ));

  }

  //--------------------------confirmWithdraw-----------------------------------

    confirmWithdraw({required String id}) async {
    isLoading = true;
    notifyListeners();
    final dataResponse = await WithdrawFreelancerRepo().confirmWithdrawRepo(id: id);
    withdrawForPreview = null;
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.balanceFreelancerPage);
  }

  clearWithdrawForPreview(){
    withdrawForPreview = null;
    notifyListeners();
  }

 //-----------------------------------------------------------------------------
  takeAmountCash(TextEditingController controller){
    controller.text = SharedPrefController().getUser().balance.toString();
    notifyListeners();
  }




    logoutBalancea() async {
     mountUserToWithdrawal  = null;branchSelected = "";
    ledgerSelected = "";
    bankAccountSelected  = null;
    officeSelected = null;
    recipientSelected = null;
    bankAccounts = [];
    withdrawals = [];
    officeList = [];
    recipients = [];
     isVisibleLedgerError = false;
     isVisibleBranchError = false;
     notifyListeners();
  }

  disposeIsLoading() {
    isLoading = false;
    notifyListeners();
  }
  }
