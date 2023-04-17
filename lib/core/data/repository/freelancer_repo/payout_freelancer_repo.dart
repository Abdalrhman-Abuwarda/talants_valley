import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talants_valley/core/data/network/api/end_points.dart';
import 'package:talants_valley/core/data/network/api/dio_client.dart';
import 'package:talants_valley/core/model/freelancer/payout/withdrawal_model.dart';
import 'package:talants_valley/core/model/freelancer/payout/recipient_model.dart';

import '../../../../locator.dart';

class PayoutFreelancerRepo {
  final DioClient  _dioClient =  locator<DioClient>();

  Future<Response> sendCodeAddBankRepo({
    required String accountName,
    required String accountNumber,
    required String bankBranch,
    required String ledger,
  }) async {
    final response =
        await _dioClient.post(Endpoints.sendCodeAddAccount, data: {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "bankBranch": bankBranch,
      "ledger": ledger
    });
    return response;
  }

  Future<Response> verifyAddAccountRepo(
      {required String accountName,
      required String accountNumber,
      required String bankBranch,
      required String ledger,
      required String code,
      required String bankName}) async {
    final response = await _dioClient.post(Endpoints.addBankAccount, data: {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "bankBranch": bankBranch,
      "ledger": ledger,
      "code": code,
      "bankName": "palestine"
    });
    return response;
  }

  Future<List<BankModel>> getBankAccountsRepo() async {
    final response = await _dioClient.get(Endpoints.getBankAccountList);
    final List bankList = response.data["data"]["banks"];
    final List<BankModel> bankAccounts =
        bankList.map((bank) => BankModel.formJson(bank)).toList();
    return bankAccounts;
  }

  Future<Response> deleteBankAccountRepo({required String idBank}) async {
    final response =
        await _dioClient.delete("${Endpoints.deleteBankAccount}$idBank");
    return response;
  }

  Future<List<WithdrawModel>> getWithdrawalsRepo() async {
    final response =
        await _dioClient.get(Endpoints.getWithdrawalRequestList);
    debugPrint("This inside Repo Layer after response ===>>> $response");
    final List dataList = response.data["data"]["withdraws"];
    final List<WithdrawModel> withdrawsList =
        dataList.map((element) => WithdrawModel.formJson(element)).toList();
    return withdrawsList;
  }

  Future<Response> requestBankWithdrawRepo(
      {required String bankId, required int amount}) async {
    final response = await DioClient(  ).post(Endpoints.requestBankWithdraw,
        data: {"amount": amount, "bankId": bankId});
    return response;
  }

  Future<List<OfficeModel>> getOfficesRepo() async {
    final response = await _dioClient.get(Endpoints.getOfficeList);
    final List dataList = response.data["data"];
    final List<OfficeModel> officeList =
        dataList.map((office) => OfficeModel.fromJson(office)).toList();
    return officeList;
  }

  Future<Response> senCodeRecipientRepo(
      {required String mobile, required String idNumber}) async {
    final response = await _dioClient.post(Endpoints.sendCodeRecipient,
        data: {"mobile": mobile, "idNumber": idNumber});
    return response;
  }

  Future<Response> verificationAddRecipient(
      {required String code,
      required String mobile,
      required String idNumber,
      required String name}) async {
    final response = await _dioClient.post(Endpoints.addRecipientRecipient,
        data: {
          "code": code,
          "mobile": "+970597039225",
          "idNumber": idNumber,
          "name": name
        });
    return response;
  }

  Future<List<RecipientModel>> getRecipientsRepo() async {
    final response = await _dioClient.get(Endpoints.getRecipients);
    final List dataList = response.data["data"]["recipients"];
    final List<RecipientModel> recipients =
        dataList.map((e) => RecipientModel.fromJson(e)).toList();
    return recipients;
  }

  Future<Response> deleteRecipientRepo({required String id}) async {
    final response =
        await _dioClient.delete("${Endpoints.deleteRecipient}$id");
    return response;
  }

  Future<Response> updateRecipientRepo(
      {required String id,
      required String code,
      required String mobile,
      required String idNumber,
      required String name}) async {
    final response = await _dioClient.put("${Endpoints.updateRecipient}$id",
        data: {
          "code" : code,
          "mobile" : mobile,
          "idNumber" : idNumber,
          "name" : name
        });
    return response;
  }


  Future<Response> requestWithdrawCashRepo(
      {required int amount,
      required String officeId,
      required String recipientId}) async {
    final response = await _dioClient.post(Endpoints.requestWithdrawCash,
        data: {
          "amount": amount,
          "officeId": officeId,
          "recipientId": recipientId
        });
    return response;
  }

  Future<WithdrawModel> getWithdrawDetailsRepo({required String id}) async {
    final response =
        await _dioClient.get("${Endpoints.getWithdrawDetails}$id");
    final withdrawDetails =
        WithdrawModel.formJson(response.data["data"]["withdraw"]);
    debugPrint("This is Details inside repo $withdrawDetails");
    return withdrawDetails;
  }

  Future<Response> cancelWithdrawRepo({required String id}) async {
    return await _dioClient.put("${Endpoints.cancelWithdraw}$id");
  }

  Future<Response> confirmWithdrawRepo({required String id}) async {
    return await _dioClient.put("${Endpoints.confirmWithdraw}$id");
  }
}
