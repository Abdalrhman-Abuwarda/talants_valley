class WithdrawModel {
  String id;
  int amount;
  BankModel? bank;
  OfficeModel? office;
  String typeWithdraw;
  String status;
  String createdAt;
  String updatedAt;
  String? confirmDocument;
  List<HistoryModel> history;

  WithdrawModel._(
      {required this.id,
      required this.amount,
      required this.bank,
      required this.office,
      required this.typeWithdraw,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.confirmDocument,
      required this.history});

  factory WithdrawModel.formJson(Map<String, dynamic> json) => WithdrawModel._(
      id: json['_id'],
      amount: json['amount'],
      bank: json['bank'] == null ? null : BankModel.formJson(json["bank"]),
      office: json['office'] == null ? null : OfficeModel.fromJson(json["office"]),
      typeWithdraw: json['typeWithdraw'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      history: json['history'],
      confirmDocument: json['confirmDocument']);
}

//------------------------------------------------------------------------------
class BankModel {
  final String id;
  final String accountName;
  final String accountNumber;
  final String bankBranch;
  final String bankName;
  final String? ledger;
  final String? currency;
  final String? createdAt;
  final String? updatedAt;
  bool isSelected;

  BankModel._(
      {required this.id,
      required this.accountName,
      required this.accountNumber,
      required this.bankBranch,
      required this.bankName,
      required this.ledger,
      required this.currency,
      required this.createdAt,
      required this.updatedAt,
      this.isSelected = false});

  factory BankModel.formJson(Map<String, dynamic> json) => BankModel._(
        id: json['_id'],
        accountName: json['accountName'],
        accountNumber: json['accountNumber'],
        bankBranch: json['bankBranch'],
        bankName: json['bankName'],
        ledger: json["ledger"],
        currency: json["currency"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}

//------------------------------------------------------------------------------
class OfficeModel {
  final String id;
  final String name;
  final String address;
  final int? fees;
  final String? startingHour;
  final String? endingHour;
  bool isSelected;

  OfficeModel._({
    required this.address,
    required this.name,
    required this.id,
    required this.fees,
    required this.startingHour,
    required this.endingHour,
    this.isSelected = false,
  });

  factory OfficeModel.fromJson(Map<String, dynamic> json) => OfficeModel._(
      address: json["address"], name: json["name"], id: json["_id"], fees: json["fees"] , startingHour: json["startingHour"] , endingHour: json["endingHour"]);
}

//------------------------------------------------------------------------------
class HistoryModel {
  final String id;
  final String type;
  final String action;
  final String status;
  final String createdBy;
  final String createdAt;
  final String updatedAt;

  HistoryModel._(
      {required this.id,
      required this.type,
      required this.action,
      required this.status,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt});

  factory HistoryModel.formJson(Map<String, dynamic> json) => HistoryModel._(
      id: json['_id'],
      type: json['type'],
      action: json['action'],
      status: json['status'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']);
}
