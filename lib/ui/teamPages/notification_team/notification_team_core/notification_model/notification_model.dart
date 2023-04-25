class NotificationModel {
  String? type;
  List<Notifications>? notifications;

  NotificationModel({this.type, this.notifications});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }
}

class Notifications {
  final String sId;
  final FreelancerSenderModel? freelancerSender;
  final String title;
  final String action;
  final String content;
  final bool isOpen;
  final bool isSeen;
  final String type;
  final ServiceModel? service;
  final String createdAt;
  final WithdrawNotification? withdraw;

  Notifications(
      {
     required this.sId,
     required this.freelancerSender,
     required this.title,
     required this.action,
     required this.content,
     required this.isOpen,
     required this.isSeen,
     required this.type,
     required this.service,
     required this.createdAt,
     required this.withdraw});

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
      sId: json['_id'],
      freelancerSender: json['freelancerSender'] != null
            ? FreelancerSenderModel.fromJson(json['freelancerSender'])
            : null,
      title: json['title'], action: json['action'], content: json['content'],
      isOpen: json['isOpen'],
      isSeen: json['isSeen'],
      type: json['type'],
      service: json['service'] != null ? ServiceModel.fromJson(json['service']) : null,
      createdAt: json['createdAt'],
      withdraw:  json['withdraw'] != null
          ? WithdrawNotification.fromJson(json['withdraw'])
          : null);

}

class FreelancerSenderModel {
  final String sId;
  final String firstName;
  final String lastName;

  FreelancerSenderModel(
      {required this.sId, required this.firstName, required this.lastName});

  factory FreelancerSenderModel.fromJson(Map<String, dynamic> json) =>
      FreelancerSenderModel(
          sId: json['_id'],
          firstName: json['firstName'],
          lastName: json['lastName']);
}

//------------------------------serviceModel------------------------------------

class ServiceModel {
  final String sId;
  final int subTotal;
  final String status;
  final String serviceNo;

  ServiceModel(
      {required this.sId,
      required this.subTotal,
      required this.status,
      required this.serviceNo});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
      sId: json['_id'],
      subTotal: json['subTotal'],
      status: json['status'],
      serviceNo: json['serviceNo']);
}

//----------------------------withdrawModel------------------------------------

class WithdrawNotification {
  final String id;
  final String amount;
  final String typeWithdraw;
  final OfficeNotification? office;
  final String status;

  WithdrawNotification(
      {required this.id,
      required this.amount,
      required this.typeWithdraw,
      required this.office,
      required this.status});

  factory WithdrawNotification.fromJson(Map<String, dynamic> json) =>
      WithdrawNotification(
          id: json["_id"],
          amount: json["amount"],
          typeWithdraw: json["typeWithdraw"],
          office: json["office"] != null ? OfficeNotification.fromJson(json["office"]) : null,
          status: json["status"]);
}

//---------------------------------officeModel----------------------------------

class OfficeNotification {
  OfficeNotification({required this.id, required this.name});

  final String id;
  final String name;

  factory OfficeNotification.fromJson(Map<String, dynamic> json) =>
      OfficeNotification(id: json["_id"], name: json["name"]);
}
