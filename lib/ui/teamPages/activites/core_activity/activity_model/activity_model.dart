class ActivityModel {
  final IdActivityModel id;
  final ActivityLogs activityLogs;
  bool isCheck;

  ActivityModel(
      {required this.id, required this.activityLogs, this.isCheck = false});

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
      id: IdActivityModel.fromJson(json['_id']),
      activityLogs: ActivityLogs.fromJson(json['activityLogs']));
}

class IdActivityModel {
  final String id;
  final String type;

  IdActivityModel({required this.id, required this.type});

  factory IdActivityModel.fromJson(Map<String, dynamic> json) =>
      IdActivityModel(id: json['id'], type: json['type']);
}

class ActivityLogs {
  late final String? id;
  late final String type;
  late final String action;
  late final String? status;
  late final String message;
  late final String createdAt;
  late final String updatedAt;
  Service? service;
  String? createdBy;
  // ActivityCreatedByModel? createdBy;
  late final WithdrawActivityModel? withdraw;

  ActivityLogs(
      {
        required this.id,
      required this.type,
      required this.action,
      this.status,
      required this.message,
      required this.createdAt,
      required this.updatedAt,
      this.service,
      this.createdBy,
      required this.withdraw});

  ActivityLogs.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    type = json['type'];
    action = json['action'];
    status = json['status'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    withdraw = json['withdraw'] != null
        ? WithdrawActivityModel.formJson(json['withdraw'])
        : null;
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    createdBy = json["createdBy"];
    // json['createdBy'] != null
    //     ? ActivityCreatedByModel.fromJson(json['createdBy'])
    //     : null;
  }
}

class Service {
  late final String? sId;
  late final List<FixedActivityModel>? fixed;
  late final String? currency;
  late final int? revenue;
  late final String? serviceNo;

  Service({this.sId, this.fixed, this.currency, this.revenue, this.serviceNo});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['fixed'] != null) {
      fixed = <FixedActivityModel>[];
      json['fixed'].forEach((v) {
        fixed!.add(FixedActivityModel.fromJson(v));
      });
    }
    currency = json['currency'];
    revenue = json['revenue'];
    serviceNo = json['serviceNo'];
  }
}

class FixedActivityModel {
  final String itemName;
  final String description;
  final int price;
  final String sId;

  FixedActivityModel(
      {required this.itemName,
      required this.description,
      required this.price,
      required this.sId});

  factory FixedActivityModel.fromJson(Map<String, dynamic> json) =>
      FixedActivityModel(
          itemName: json['itemName'],
          description: json['description'],
          price: json['price'],
          sId: json['_id']);
}

class ActivityCreatedByModel {
  final String id;
  final String firstName;
  final String lastName;

  ActivityCreatedByModel(
      {required this.id, required this.firstName, required this.lastName});

  factory ActivityCreatedByModel.fromJson(Map<String, dynamic> json) =>
      ActivityCreatedByModel(
          id: json['_id'],
          firstName: json['firstName'],
          lastName: json['lastName']);
}

class WithdrawActivityModel {
  WithdrawActivityModel(
      {required this.id, required this.amount, required this.typeWithdraw});

  final String id;
  final String amount;
  final String typeWithdraw;

  factory WithdrawActivityModel.formJson(Map<String, dynamic> json) =>
      WithdrawActivityModel(
          id: json["_id"],
          amount: json["amount"].toString(),
          typeWithdraw: json["typeWithdraw"]);
}



class TimeLineActivityModel{
  TimeLineActivityModel({required this.id , required this.activityLogs});
  final String id;
  final ActivityLogs activityLogs;
  
  
  // factory TimeLineActivityModel.fromJson(Map<String , dynamic> json) => TimeLineActivityModel(id: json["_id"], activityLogs: activityLogs);
}
