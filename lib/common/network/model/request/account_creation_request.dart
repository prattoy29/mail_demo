// To parse this JSON data, do
//
//     final accountCreationRequest = accountCreationRequestFromMap(jsonString);

import 'dart:convert';

String userAuthRequestToMap(UserAuthRequest data) => json.encode(data.toMap());

class UserAuthRequest {
  String? address;
  String? password;

  UserAuthRequest({
    this.address,
    this.password,
  });

  Map<String, dynamic> toMap() => {
    "address": address,
    "password": password,
  };
}
