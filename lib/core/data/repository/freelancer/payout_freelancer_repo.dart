import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/dioClient.dart';
import 'package:talants_valley/core/model/freelancer/withdrawal_model.dart';
import 'package:talants_valley/core/model/recipient_model.dart';

class PayoutFreelancerRepo {
  Dio dio = Dio();

  Future<dynamic> sendCodeAddBankRepo({
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
  }) async {
    final response =
        await DioClient(dio).post(Endpoints.sendCodeAddAccount, data: {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "bankBranch": bankBranch,
      "ledger": ledger
    });
    return response;
  }

  Future<dynamic> verifyAddAccountRepo(
      {required String accountName,
      required String accountNumber,
      required String bankBranch,
      required String ledger,
      required String code,
      required String bankName}) async {
    final response = await DioClient(dio).post(Endpoints.addBankAccount, data: {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "bankBranch": bankBranch,
      "ledger": ledger,
      "code": code,
      "bankName": "palestine"
    });
    return response;
  }

  Future<dynamic> getBankAccountListRepo() async {
    final response = await DioClient(dio).get(Endpoints.getBankAccountList);
    final List bankList = response.data["data"]["banks"];
    final List<BankModel> bankAccounts =
        bankList.map((bank) => BankModel.formJson(bank)).toList();
    return bankAccounts;
  }

  Future<Response> deleteBankAccountRepo({required String idBank}) async {
    final response =
        await DioClient(dio).delete("${Endpoints.deleteBankAccount}$idBank");
    return response;
  }

  Future<dynamic> getWithdrawalRequestList() async {
    debugPrint("This inside Repo Layer before response ,,,,, ");
    final response =
        await DioClient(dio).get(Endpoints.getWithdrawalRequestList);
    debugPrint("This inside Repo Layer after response ===>>> $response");
    final List dataList = response.data["data"]["withdraws"];
    final List<WithdrawModel> withdrawsList =
        dataList.map((element) => WithdrawModel.formJson(element)).toList();
    return withdrawsList;
  }

  Future<dynamic> requestBankWithdrawRepo(
      {required String bankId, required int amount}) async {
    final response = await DioClient(dio).post(Endpoints.requestBankWithdraw,
        data: {"amount": amount, "bankId": bankId});
    return response;
  }

  Future<dynamic> getOfficeListRepo() async {
    final response = await DioClient(dio).get(Endpoints.getOfficeList);
    final List dataList = response.data["data"];
    final List<OfficeModel> officeList =
        dataList.map((office) => OfficeModel.fromJson(office)).toList();
    return officeList;
  }

  Future<dynamic> senCodeRecipientRepo(
      {required String mobile, required String idNumber}) async {
    final response = await DioClient(dio).post(Endpoints.sendCodeRecipient,
        data: {"mobile": mobile, "idNumber": idNumber});
    return response;
  }

  Future<dynamic> verificationAddRecipient(
      {required String code,
      required String mobile,
      required String idNumber,
      required String name}) async {
    final response = await DioClient(dio).post(Endpoints.addRecipientRecipient,
        data: {
          "code": code,
          "mobile": "+970597039225",
          "idNumber": idNumber,
          "name": name
        });
    return response;
  }

  Future<dynamic> getRecipientsRepo() async {
    final response = await DioClient(dio).get(Endpoints.getRecipients);
    final List dataList = response.data["data"]["recipients"];
    final List<RecipientModel> recipients =
        dataList.map((e) => RecipientModel.fromJson(e)).toList();
    return recipients;
  }

  Future<dynamic> deleteRecipientRepo({required String id}) async {
    final response =
        await DioClient(dio).delete("${Endpoints.deleteRecipient}$id");
    return response;
  }

  Future<dynamic> updateRecipientRepo(
      {required String id,
      required String code,
      required String mobile,
      required String idNumber,
      required String name}) async {
    final response = await DioClient(dio).put("${Endpoints.updateRecipient}$id",
        data: {
          "code": code,
          "mobile": mobile,
          "idNumber": idNumber,
          "name": name
        });
    return response;
  }

  Future<dynamic> requestWithdrawCashRepo(
      {required int amount,
      required String officeId,
      required String recipientId}) async {
    final response = await DioClient(dio).post(Endpoints.requestWithdrawCash,
        data: {
          "amount": amount,
          "officeId": officeId,
          "recipientId": recipientId
        });
    return response;
  }

  Future<dynamic> getWithdrawDetailsRepo({required String id}) async {
    final response =
        await DioClient(dio).get("${Endpoints.getWithdrawDetails}$id");
    final withdrawDetails =
        WithdrawModel.formJson(response.data["data"]["withdraw"]);
    debugPrint("This is Details inside repo $withdrawDetails");
    return withdrawDetails;
  }

  Future<dynamic> cancelWithdrawRepo({required String id}) async {
    return await DioClient(dio).put("${Endpoints.cancelWithdraw}$id");
  }

  Future<dynamic> confirmWithdrawRepo({required String id}) async {
    return await DioClient(dio).put("${Endpoints.confirmWithdraw}$id");
  }
}
