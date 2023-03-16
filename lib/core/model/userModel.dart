import 'package:talants_valley/core/model/responseDataModel.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? mobile;
  final String balance;
  bool verifiedEmail;
  bool verifiedMobile;
  final VerifiedAddress verifiedAddress;
  final VerifiedId verifiedId;
  late final int role;
  final Address? address;
  late bool isBlocked;
  final String? createdAt;
  final int? profit;
  final int? revenue;
  final String? lastLogin;
  final String? updateAt;
  UserModel._(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobile,
      required this.balance,
      required this.verifiedEmail,
      required this.verifiedMobile,
      required this.verifiedAddress,
      required this.verifiedId,
      required this.role,
      required this.address,
      required this.isBlocked,
      required this.createdAt,
        required this.profit,
        required this.revenue,
        required this.lastLogin,
        required this.updateAt
      });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel._(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      mobile: json['mobile'],
      balance: json['balance'].toString(),
      verifiedEmail: json['verifiedEmail'],
      verifiedMobile: json['verifiedMobile'],
      verifiedAddress: VerifiedAddress.fromJson(json['verifiedAddress']),
      verifiedId: VerifiedId.fromJson(json['verifiedId']),
      role: json['role'],
      address: json['address'] == null ? null : Address.fromJson(json['address']),
      // address: Address.fromJson(json['address']),
      isBlocked: json['isBlocked'],
      createdAt: json["createdAt"],
      profit: json['profit'],
    revenue: json['revenue'],
    lastLogin: json['lastLogin'],
    updateAt: json['updateAt'],
  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['balance'] = balance;
    data['verifiedEmail'] = verifiedEmail;
    data['verifiedMobile'] = verifiedMobile;
    data['verifiedAddress'] = verifiedAddress.toJson();
    data['verifiedId'] = verifiedId.toJson();
    data['role'] = role;
    data['address'] = address?.toJson();
    data['isBlocked'] = isBlocked;
    data['createdAt'] = createdAt;
    data['profit'] = profit;
    data['revenue'] = revenue;
    data['lastLogin'] =lastLogin;
    data['updateAt'] = updateAt;
    return data;
  }
}
