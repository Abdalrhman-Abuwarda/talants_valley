import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';
import 'package:talants_valley/core/model/freelancer/withdrawal_model.dart';
import 'package:talants_valley/core/model/recipient_model.dart';

class WithdrawFreelancerRep{
  Dio dio = Dio();

  Future<dynamic> sendCodeAddBankRepo({required String accountName, required String accountNumber, required String bankBranch, required String ledger, }) async{
    final response = await DioClient(dio).post(Endpoints.sendCodeAddAccount , data:
    {
      "accountName" : accountName,
      "accountNumber" : accountNumber,
      "bankBranch" : bankBranch,
      "ledger" : ledger
    });
    debugPrint("This is sentCodeAddBank response in repo \n $response");
  }

  Future<dynamic> verifyAddAccountRepo({required String accountName, required String accountNumber, required String bankBranch, required String ledger, required String code, required String bankName}) async{
    final response = await DioClient(dio).post(Endpoints.addBankAccount, data:
    {
      "accountName" : accountName,
      "accountNumber" : accountNumber,
      "bankBranch" : bankBranch,
      "ledger" : ledger,
      "code": code,
      "bankName": "palestine"
    });
    debugPrint("This is confirmAddAccountRepo response in repo \n $response");
  }


  Future<dynamic> getBankAccountListRepo() async {
    final response = await DioClient(dio).get(Endpoints.getBankAccountList);
    debugPrint("This is getBankAccountListRepo response in repo \n $response");
    debugPrint("This is getBankAccountListRepo response in repo \n ${response.data["data"]["banks"]}");
    final List bankList = response.data["data"]["banks"];
    final List<BankModel> bankAccounts = bankList.map((bank) => BankModel.formJson(bank)).toList();
    return bankAccounts;
  }

  Future<dynamic> deleteBankAccountRepo({required String idBank}) async {
    final response = await DioClient(dio).delete("${Endpoints.deleteBankAccount}$idBank");
    debugPrint("This is deleteBankAccountRepo response in repo \n $response");
    debugPrint("This is deleteBankAccountRepo response in repo \n ${response.data["message"]}");
  }

  Future<dynamic> getWithdrawalRequestList() async {
    final response = await DioClient(dio).get(Endpoints.getWithdrawalRequestList);
    debugPrint("This is deleteBankAccountRepo response in repo \n $response");
    debugPrint("This is deleteBankAccountRepo response in repo \n ${response.data["data"]["withdraws"]}");
    final List dataList = response.data["data"]["withdraws"];
    final List<WithdrawModel> withdrawsList = dataList.map((element) => WithdrawModel.formJson(element)).toList();
    return withdrawsList;
  }

  Future<dynamic> requestBankWithdrawRepo({required String bankId, required int amount}) async {
    final response = await DioClient(dio).post(Endpoints.requestBankWithdraw, data:
    {
      "amount": amount,
      "bankId": bankId
    });
    debugPrint("This is requestBankWithdrawRepo response in repo \n $response");
    // debugPrint("This is requestBankWithdrawRepo response in repo \n ${response.data["data"]["withdraws"]}");
  }

  Future<dynamic> getOfficeListRepo() async{
    final response = await DioClient(dio).get(Endpoints.getOfficeList);
    debugPrint("This is getOfficeListRepo response in repo \n $response");
    debugPrint("This is getOfficeListRepo response in repo \n ${response.data["data"]}");
    final List dataList = response.data["data"];
    final List<OfficeModel> officeList = dataList.map((office) => OfficeModel.fromJson(office)).toList();
    return officeList;
  }

  Future<dynamic> senCodeRecipientRepo({required String mobile, required String idNumber}) async {
    final response = await DioClient(dio).post(Endpoints.sendCodeRecipient, data:
    {
      "mobile": mobile,
      "idNumber": idNumber
    });
    debugPrint("This is senCodeRecipientRepo response in repo \n $response");
    debugPrint("This is senCodeRecipientRepo response in repo \n ${response.data}");
  }
  
  Future<dynamic> verificationAddRecipient({required String code, required String mobile, required String idNumber, required String name}) async {
    final response = await DioClient(dio).post(Endpoints.addRecipientRecipient, data:
    {
      "code" : code,
      "mobile" : "+970597039225",
      "idNumber" : idNumber,
      "name" : name
    }
    );
    debugPrint("This is verificationAddRecipient response in repo \n $response");
    debugPrint("This is verificationAddRecipient response in repo \n ${response.data}");
  }

  Future<dynamic> getRecipientsRepo() async {
    final response = await DioClient(dio).get(Endpoints.getRecipients);
    debugPrint("This is getRecipients response in repo \n $response");
    debugPrint("This is getRecipients in repo \n ${response.data}");
    final List dataList = response.data["data"]["recipients"];
    final List<RecipientModel> recipients = dataList.map((e) => RecipientModel.fromJson(e)).toList();
    return recipients;
  }

  Future<dynamic> deleteRecipientRepo({required String id}) async {
    final response = await DioClient(dio).delete("${Endpoints.deleteRecipient}$id");
    debugPrint("This is deleteRecipientRepo response in repo \n $response");
    debugPrint("This is deleteRecipientRepo in repo \n ${response.data["message"]}");
  }

  Future<dynamic> updateRecipientRepo ({required String id, required String code, required String mobile , required String idNumber, required String name}) async  {
    final response = await DioClient(dio).put("${Endpoints.updateRecipient}$id" , data:
    {
      "code" : code,
      "mobile" : "+972592426177",
      "idNumber" : "21515151511",
      "name" : "عبدالرحمن ماجد أبووردة"
    }
    );
  }

  Future<dynamic> requestWithdrawCashRepo({required int amount, required String officeId, required String recipientId}) async {
    final response = await DioClient(dio).post(Endpoints.requestWithdrawCash, data:
    {
      "amount": amount,
      "officeId": officeId,
      "recipientId": recipientId
    });
    debugPrint("This is withdrawRequestCash response in repo \n $response");
    debugPrint("This is withdrawRequestCash in repo \n ${response.data}");

  }

}