import 'package:talants_valley/core/model/userModel.dart';

class DataModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  DataModel._(
      {required this.accessToken,
      required this.refreshToken,
      required this.user});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel._(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        user: UserModel.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['user'] = user.toJson();
    return data;
  }
}

//---------------------------------VerifiedAddressModel-----------------------------------

class VerifiedAddress {
  final DisapproveReason? disapproveReason;
  final String status;
  final String? addressDocumentType;
  final String? addressFile;
  final String? otherDocumentType;

  VerifiedAddress._(
      {required this.disapproveReason,
      required this.status,
      this.addressDocumentType,
      this.addressFile,
      this.otherDocumentType});

  factory VerifiedAddress.fromJson(Map<String, dynamic> json) =>
      VerifiedAddress._(
        disapproveReason: json['disapproveReason'] == null
            ? null
            : DisapproveReason.fromJson(json['disapproveReason']),
        // disapproveReason = new DisapproveReason.fromJson(json['disapproveReason']) ;
        status: json["status"],
        addressDocumentType: json["addressDocumentType"],
        addressFile: json["addressFile"],
        otherDocumentType: json["otherDocumentType"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disapproveReason'] = disapproveReason?.toJson();
    data['status'] = status;
    data["addressDocumentType"] = addressDocumentType;
    data["addressFile"] = addressFile;
    data["otherDocumentType"] = otherDocumentType;
    return data;
  }
}

//--------------------------------------------DisapproveReasonModel-------------------------------

class DisapproveReason {
  final Map<String, dynamic>? disapproveReason;
  final String? reason;
  final String? note;

  DisapproveReason._({this.disapproveReason, this.reason, this.note});

  factory DisapproveReason.fromJson(Map<String, dynamic> json) =>
      DisapproveReason._(
        disapproveReason: json["disapproveReason"],
        reason: json["reason"],
        note: json["note"]
      );

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["disapproveReason"] = disapproveReason;
    data["reason"] = reason;
    data["note"] = note;
    return data;
  }
}

//------------------------AddressModel------------------------------
class Address {
  final String country;
  final String? city;
  final String? address1;
  final String? address2;

  Address._({required this.country, this.city, this.address1, this.address2});


  factory Address.fromJson(Map<String, dynamic> json) => Address._(
        country: json["country"],
        city: json["city"],
        address1: json["address1"],
        address2: json["address2"],
      );

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data["city"] = city;
    data["address1"] = address1;
    data["address2"] = address2;
    return data;
  }
}

//-------------------------verifiedId--------------------------

class VerifiedId {
  final DisapproveReason? disapproveReason;
  final String status;
  final String? idDocumentType;
  final String? idNumber;
  final String? idFile;

  VerifiedId._(
      {required this.disapproveReason,
      required this.status,
      this.idDocumentType,
      this.idNumber,
      this.idFile});

  factory VerifiedId.fromJson(Map<String, dynamic> json) => VerifiedId._(
        disapproveReason: json['disapproveReason'] == null
            ? null
            : DisapproveReason.fromJson(json['disapproveReason']),
        status: json['status'],
        idDocumentType: json['idDocumentType'],
        idNumber: json['idNumber'],
        idFile: json['idFile'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disapproveReason'] =
        disapproveReason == null ? null : disapproveReason!.toJson();
    data['status'] = status;
    data['idDocumentType'] = idDocumentType;
    data['idNumber'] = idNumber;
    data['idFile'] = idFile;
    return data;
  }
}

//-------------------------UserModel---------------------------
