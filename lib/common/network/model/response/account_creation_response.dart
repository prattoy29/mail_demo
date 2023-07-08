// To parse this JSON data, do
//
//     final accountCreationResponse = accountCreationResponseFromMap(jsonString);

import 'dart:convert';

AccountCreationResponse accountCreationResponseFromMap(String str) => AccountCreationResponse.fromMap(json.decode(str));

class AccountCreationResponse {
  String? context;
  String? id;
  String? type;
  String? accountCreationResponseId;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  AccountCreationResponse({
    this.context,
    this.id,
    this.type,
    this.accountCreationResponseId,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory AccountCreationResponse.fromMap(Map<String, dynamic> json) => AccountCreationResponse(
    context: json["@context"],
    id: json["@id"],
    type: json["@type"],
    accountCreationResponseId: json["id"],
    address: json["address"],
    quota: json["quota"],
    used: json["used"],
    isDisabled: json["isDisabled"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );
}
