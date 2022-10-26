import 'package:talants_valley/core/model/responseDataModel.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int balance;
  final bool verifiedEmail;
  final bool verifiedMobile;
  final VerifiedAddress verifiedAddress;
  final VerifiedId verifiedId;
  final int role;
  final Address address;
  final bool isBlocked;

  User._({
    required this.id,
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
    required this.isBlocked
   });

  factory User.fromJson(Map<String, dynamic> json) => User._(
    id : json['_id'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    email : json['email'],
    mobile : json['mobile'],
    balance : json['balance'],
    verifiedEmail : json['verifiedEmail'],
    verifiedMobile : json['verifiedMobile'],
    verifiedAddress : VerifiedAddress.fromJson(json['verifiedAddress']),
    verifiedId : VerifiedId.fromJson(json['verifiedId']) ,
    role : json['role'],
    address : Address.fromJson(json['address']),
    isBlocked : json['isBlocked'],
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
    data['address'] = address.toJson();
    data['isBlocked'] = isBlocked;
    return data;
  }
}