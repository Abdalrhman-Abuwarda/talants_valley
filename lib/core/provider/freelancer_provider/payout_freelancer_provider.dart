import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/local/shared_controller.dart';
import 'package:talants_valley/core/model/freelancer/payout/recipient_model.dart';
import 'package:talants_valley/routing/router.dart';

import '../../../routing/navigations.dart';
import '../../../utils/helper.dart';
import '../../data/repository/freelancer_repo/payout_freelancer_repo.dart';
import '../../model/freelancer/payout/withdrawal_model.dart';
import 'package:talants_valley/locator.dart';

class PayoutFreelancerProvider extends ChangeNotifier{
  SharedPrefController sharedPref = SharedPrefController();

  final PayoutFreelancerRepo  _repo =  locator<PayoutFreelancerRepo>();


   bool isVisibleHomeError = false;
   bool isVisibleAmountCashError = false;
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
   bool secondLoading = false;



  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if(seconds != 0 ) {
        seconds--;
        notifyListeners();
      }else if(seconds == 0 && minutes != 0){
        if (minutes != 0 ){
          minutes--;
          seconds += 59;
        }
      }
      else {
        timer?.cancel();
        notifyListeners();
      }
    });
  }


//------------------------------resendCodeAddBank-------------------------------
  resendCodeAddBank() async {
    seconds = 60;
    minutes = 1;
    notifyListeners();
    await _repo.sendCodeAddBankRepo(accountName: sharedPref.getBankAccountName(), accountNumber: sharedPref.getBankAccountNumber(), bankBranch: sharedPref.getBankAccountBranch(), ledger: sharedPref.getBankAccountLeger());
    startTimer();
    notifyListeners();
  }


//------------------------------------------------------------------------------

  resendCodeAddRecipient() async{
    seconds = 60;
    minutes = 1;
    notifyListeners();
    await _repo.senCodeRecipientRepo(mobile: sharedPref.getMobileRecipient(), idNumber: sharedPref.getIdNumberRecipient());
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

//------------------------------disposeTimer------------------------------------

  disposeTimer(){
    seconds = 60;
    minutes = 1;
    timer?.cancel();
    notifyListeners();
  }

//-----------------------------selectBranch-------------------------------------

  selectBranch({required String branch}){
    branchSelected = branch;
    ServiceNavigation.serviceNavi.popFunction();
    notifyListeners();
  }

//-----------------------------selectLedger-------------------------------------

  selectLedger({required String ledger}){
    ledgerSelected = ledger;
    ServiceNavigation.serviceNavi.popFunction();
    notifyListeners();
  }

//------------------------------selectOffice------------------------------------

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
      await _repo.sendCodeAddBankRepo(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger);
      SharedPrefController().savaBankAccountToVerify(accountName: accountName, accountNumber: accountNumber, bankBranch: bankBranch, ledger: ledger, bankName: "Palestine");
      isVisibleHomeError = false;
      notifyListeners();
      startTimer();
      notifyListeners();
      ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.verificationAddBnkPage);
    }
  }

//-----------------------------verifyAddBnkPage---------------------------------

    verifyAddBnkPage({ required String code}) async{
    isLoading = true;
    await _repo.verifyAddAccountRepo(accountName: SharedPrefController().getBankAccountName(), accountNumber: SharedPrefController().getBankAccountNumber(), bankBranch: SharedPrefController().getBankAccountBranch(), ledger: SharedPrefController().getBankAccountLeger(), code: code, bankName: "Palestine");
    disposeTimer();
    Helpers.balanceShowSnackBar(message: "Bank account has been added.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.chooseBankAccountPage);
  }

//----------------------------getBankAccountList--------------------------------

  getBankAccountList() async {
    isLoading = true;
    // notifyListeners();
    final response = await _repo.getBankAccountsRepo();
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
            final dataResponse = await _repo.deleteBankAccountRepo(idBank: bankId);
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
    final dataResponse = await _repo.getWithdrawalsRepo();
    withdrawals = dataResponse;
    debugPrint(" This is the length =>>> ${withdrawals.length.toString()}");
    notifyListeners();
}


//-----------------------------getOfficeList------------------------------------

    getOfficeList() async{
    isLoading = true;
    final dataResponse = await _repo.getOfficesRepo();
    officeList  = dataResponse;
    officeSelected = officeList.first;
    notifyListeners();
  }


//------------------------------------------------------------------------------

   sendCodeRecipient({required String mobile, required String idNumber, required String name}) async {
    isLoading = true;
    notifyListeners();
    await _repo.senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
    sharedPref.saveRecipientData(mobile: mobile, idNumber: idNumber, name: name);
    debugPrint("This is data Recipient in Shared Pref ${sharedPref.getNameRecipient()} , ${sharedPref.getIdNumberRecipient()} , ${sharedPref.getMobileRecipient()}");
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.verificationAddRecipientPage);
    startTimer();
    notifyListeners();
  }

//------------------------------------------------------------------------------

   verificationAddRecipient({required String code , required String mobile, required String idNumber, required String name}) async{
    isLoading = true;
    notifyListeners();
    await _repo.verificationAddRecipient(code: code, mobile: mobile, idNumber: idNumber, name: name);
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
 }

//------------------------------------------------------------------------------
    getRecipients() async {
    isLoading = true;
    final dataResponse = await _repo.getRecipientsRepo();
    recipients = dataResponse;
    notifyListeners();
  }

 //-----------------------------------------------------------------------------

    deleteRecipient({required String? id}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          isLoading: secondLoading,
          content: "Are you sure you want to delete this recipient?",
          onPressed: () async {
            secondLoading = true;
            notifyListeners();
            await _repo.deleteRecipientRepo(id: id!);
            recipients.removeWhere((item) => item.id == id);
            notifyListeners();
            ServiceNavigation.serviceNavi.popFunction();
            Helpers.balanceShowSnackBar(message: "Recipient has been deleted.");
          },
        ));
  }

//------------------------------------------------------------------------------

  sendCodeUpdateRecipient({ required String id ,required String mobile, required String idNumber, required String name }) async{
    isLoading = true;
    notifyListeners();
  await _repo.senCodeRecipientRepo(mobile: mobile, idNumber: idNumber);
  sharedPref.saveRecipientData(name: name, mobile: mobile, idNumber: idNumber);
  sharedPref.saveIdRecipient(id: id);
  notifyListeners();
  ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.verificationEditRecipient);
  startTimer();
  notifyListeners();
}

//------------------------updateRecipient---------------------------------------

  updateRecipient({required String code, required String id, required String mobile , required String idNumber, required String name}) async{
    isLoading = true;
    notifyListeners();
    await _repo.updateRecipientRepo(id: id, code: code, mobile: mobile, idNumber: idNumber, name: name);
    Helpers.balanceShowSnackBar(message: "Recipient has been Edited.");
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.chooseRecipientFreelancerPage);
}


//-----------------------addAmountBankToWithdraw--------------------------------
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

//-----------------------------------------------------------------------------

  selectRecipientFromRecipientsPage({required String idNumber}) {
    for (var element in recipients) {
      element.isSelected = false;
    }
    final int index = recipients.indexWhere((element) => element.idNumber == idNumber);
    recipients[index].isSelected = true;
    recipientSelected = recipients[index];
    notifyListeners();
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
    sharedPref.saveIdRecipient(id: recipient.id!);
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.editRecipientPage);
  }

  //--------------------------requestBankWithdraw-------------------------------
    requestBankWithdraw({required String bankId, required int amount}) async {
    isLoading = true;
    notifyListeners();
    await _repo.requestBankWithdrawRepo(bankId: bankId, amount: amount);
    withdrawalsIsUpdated == true;
    notifyListeners();
    Helpers.balanceShowSnackBar(message: "Wait for the payment to be ready within \n 24 hours.");
    ServiceNavigation.serviceNavi.pushNamedAndRemoveUtils(RouteGenerator.mainFreelancerPage);

  }

  //------------------------requestCashWithdraw---------------------------------
    requestCashWithdraw({required String amount, required String officeId, required String recipientId}) async{
    isLoading = true;
    notifyListeners();
    await _repo.requestWithdrawCashRepo(amount: int.parse(amount), officeId: officeId, recipientId: recipientId);
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

//---------------------------getWithdrawDetails---------------------------------

   getWithdrawDetails({required withdrawId}) async {
    secondLoading = true;
    notifyListeners();
    final dataResponse = await _repo.getWithdrawDetailsRepo(id: withdrawId!);
    debugPrint("This is details inside provider =>>> $dataResponse");
    withdrawForPreview = dataResponse;
    withdrawForPreview!.office == null ?
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.previewBankWithdrawalStatus)
        :
    ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.previewCashWithdrawalStatus);
    notifyListeners();

 }

 //----------------------------cancelWithdraw-----------------------------------

    cancelWithdraw({required String withdrawId}) async {
    showDialog(
        context: contextKey,
        builder: (context) =>  BalanceAlertDialog(
          isLoading: secondLoading,
          content: "Are you sure you want to delete your Withdraw?",
          onPressed: () async {
            secondLoading = true;
            notifyListeners();
            await _repo.cancelWithdrawRepo(id: withdrawId);
            Helpers.balanceShowSnackBar(message: "Withdraw has been deleted.");
            ServiceNavigation.serviceNavi.pushNamedWidget(RouteGenerator.balanceFreelancerPage);
          },
        ));
  }

  //--------------------------confirmWithdraw-----------------------------------

    confirmWithdraw({required String id}) async {
    isLoading = true;
    notifyListeners();
    await _repo.confirmWithdrawRepo(id: id);
    withdrawForPreview = null;
    notifyListeners();
    ServiceNavigation.serviceNavi.pushNamedReplacement(RouteGenerator.balanceFreelancerPage);
  }

  //----------------------------------------------------------------------------
  clearWithdrawForPreview(){
    withdrawForPreview = null;
    notifyListeners();
  }

 //-----------------------------------------------------------------------------
  takeAmountCash(TextEditingController controller){
    controller.text = SharedPrefController().getUser().balance.toString();
    notifyListeners();
  }


//----------------------------logoutBalance-------------------------------------

    logoutBalance() async {
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
    secondLoading = false;
    notifyListeners();
  }
  }
